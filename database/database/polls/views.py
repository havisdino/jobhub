from django.shortcuts import render, redirect
from django.http import HttpResponse
from .models import company,application,profile,recuitment_new
from .forms import PostProfile,PostCompany
from django.contrib import messages
from django.views import View
from django.contrib.auth import authenticate,login,decorators
from django.contrib.auth.models import User
from django.contrib.auth.mixins import LoginRequiredMixin
from time import time
# Create your views here.

class classIndex(View):
    def get(View,request):
        return render(request,"polls/index.html")

def view_data(request):
    c = company.objects.all()
    context = {"ds": c}
    return render(request,"polls/data.html",context)

def detailview(request,company_id):
    c = company.objects.get(pk = company_id)
    r = recuitment_new.objects.filter(company = company_id)
    context = {"com":c, "recuit": r}
    return render(request,"polls/detail.html",context)

class Weblogin(View):
    def get(view,request):
        return render(request,"polls/login.html")
    
    def post(View,request):
        user_name = request.POST.get('useremail')
        matkhau = request.POST.get('password')
        my_user = authenticate(username=user_name,password=matkhau)
        if my_user is None:
            return redirect("/forgot_password/")
        login(request,my_user)
        return redirect("/")

class Viewuser(View,LoginRequiredMixin):
    login_url = "/login/"
    def get(self,request):
        if not request.user.is_authenticated:
            return redirect("/login/")
        else:
            return redirect("/")
def forgot_password(request):
    return render(request,"polls/forgot-password.html")

def register(request):
    return render(request,"polls/register.html")

def hisview(request):
    c = application.objects.filter(profile_id = request.user.profile)
    context = {"app":c}
    return render(request,"polls/history_view.html",context)

        
class tmp(LoginRequiredMixin,View):
    login_url = "/login/"
    def get(View,request):
            try:
                c = profile.objects.get(user = request.user)
            except profile.DoesNotExist:
                c = None
            a = PostProfile(instance= c)
            context = {'f':a, 'pro': c}
            return render(request,"polls/tmp_resume.html",context)
    def post(View,request):
        q = PostProfile(request.POST)
        if q.is_valid():
            first_name = q.cleaned_data['first_name']
            last_name = q.cleaned_data['last_name'] 
            dob = q.cleaned_data['dob']
            email = q.cleaned_data['email']
            phone = q.cleaned_data['phone']
            address = q.cleaned_data['address']
            description_text = q.cleaned_data['description_text']
            country = q.cleaned_data['country']
            facebook = q.cleaned_data['facebook']
            d = profile.objects.update_or_create(user = request.user,defaults={'user': request.user,'last_name': last_name,
                                                                            'first_name':first_name,'dob':dob,'email':email,
                                                                            'phone': phone,'address': address,'description_text': description_text,
                                                                            'country':country,'facebook':facebook})
            messages.info(request, 'Profile của bạn đã được cập nhật!')
        else:
            messages.info(request, 'Opps! không lưu được rồi!')
        return redirect("/tmp_resume/")
    
class recuit(View):
    def get(View,request):
        c = recuitment_new.objects.all()
        context = {"ds": c}
        return render(request,"polls/news.html",context)
    
class detail_new(View):
    def get(View,request,new_id):
        r = recuitment_new.objects.get(pk = new_id)
        context = {"new": r}
        return render(request,"polls/detail_new.html",context)
    def post(view,request,new_id):
            r = recuitment_new.objects.get(pk = new_id)
            if request.method == "POST":
                new,created = application.objects.update_or_create(recuitment_id = r,profile_id = request.user.profile,defaults={'recuitment_id': r,'profile_id': request.user.profile})
                if created:
                    messages.info(request, 'bạn đã apply thành công!nãy đợi sự hồi đáp của công ty qua email')
                else:
                    messages.info(request, 'Bạn đã apply tin này rồi')
                return redirect(request.path_info)
def sreach(request):
    if request.method == "POST":
        sreached = request.POST['sreached']
        companySreached = company.objects.filter(name__contains= sreached)
        recuit_sreach = recuitment_new.objects.filter(name__contains = sreached)
        return render(request,"polls/sreach_result.html",{'sreached': sreached,'companys':companySreached,'recuit': recuit_sreach})

def qna(request):
    return render(request,"polls/qna.html")

def add_com(request):
    if request.method == "POST":
        form = PostCompany(request.POST)
        if form.is_valid():
            com = form.save(commit= False)
            com.employer = request.user.id
            com.save()
            messages.info(request, 'Profile của bạn đã được cập nhật!')
        else:
            messages.info(request, 'Opps! không lưu được rồi!')
        return redirect("/my_com/")
    else:
        form = PostCompany
        return render(request,"polls/add_company.html",{'form': form})
    
def my_com_list(request):
    coms = company.objects.filter(employer = request.user.id)
    return render(request,"polls/com_list.html",{'com': coms})

def update_com(request,company_id):
    com = company.objects.get(pk = company_id)
    form = PostCompany(request.POST or None,instance=com)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect("/my_com/")
    return render(request,"polls/update_com.html",{'form':form})

def my_news(request):
    coms = company.objects.filter(employer = request.user.id)
    news = []
    for i in coms:
        news += recuitment_new.objects.filter(company = i)
    return render(request,"polls/my_recuit_news.html",{'news': news})

def applied_profile(request,news_id):
    recuit = recuitment_new.objects.get(pk = news_id)
    applied = application.objects.filter(recuitment_id = recuit)
    return render(request,"polls/applied_pro.html",{'applied': applied})

def show_pro(request,profile_id):
    pro = profile.objects.get(pk = profile_id)
    return render(request,"polls/show_pro.html",{'pro':pro})