from django.shortcuts import render, redirect
from django.http import HttpResponse
from .models import company,application,profile,recuitment_new
from .forms import PostProfile
from django.contrib import messages
from django.views import View
from django.contrib.auth import authenticate,login,decorators
from django.contrib.auth.models import User
from django.contrib.auth.mixins import LoginRequiredMixin
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
    c = application.objects.all()
    context = {"app":c}
    return render(request,"polls/history_view.html",context)

        
class tmp(LoginRequiredMixin,View):
    login_url = "/login/"
    def get(View,request):
            c = profile.objects.last()
            a = PostProfile()
            context = {'f':a, 'pro': c}
            return render(request,"polls/tmp_resume.html",context)
    def post(View,request):
        q = PostProfile(request.POST)
        if q.is_valid():
            q.save()
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