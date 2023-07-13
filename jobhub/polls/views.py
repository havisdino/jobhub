from django.shortcuts import render, redirect
from django.http import HttpResponse
from .models import Company, Application, Profile, RecuitmentNews
from .forms import PostProfile, PostCompany, PostNew, SignUpForm
from django.contrib import messages
from django.views import View
from django.contrib.auth import authenticate, login, decorators, logout
from django.contrib.auth.models import User
from django.contrib.auth.mixins import LoginRequiredMixin
from time import time
# Create your views here.


class Index(View):
    def get(View, request):
        return render(request, "polls/index.html")


class WebLogin(View):
    def get(view, request):
        return render(request, "polls/login.html")

    def post(View, request):
        user_name = request.POST.get('useremail')
        matkhau = request.POST.get('password')
        my_user = authenticate(username=user_name, password=matkhau)
        if my_user is None:
            return redirect("/forgot_password/")
        login(request, my_user)
        return redirect("/")


class ViewUser(View, LoginRequiredMixin):
    login_url = "/login/"

    def get(self, request):
        if not request.user.is_authenticated:
            return redirect("/login/")
        else:
            return redirect("/")


class TMP(LoginRequiredMixin, View):
    login_url = "/login/"

    def get(View, request):
        c = Profile.objects.get(user=request.user)
        a = PostProfile(instance=c)
        context = {'f': a, 'pro': c}
        return render(request, "polls/tmp_resume.html", context)

    def post(View, request):
        c = Profile.objects.get(user=request.user)
        q = PostProfile(request.POST, request.FILES, instance=c)
        if q.is_valid():
            q.save()
            messages.info(
                request, 'Your profile has been updated!')
        else:
            messages.info(request, 'Opps! Something went wrong!')
        return redirect("/tmp_resume/")


class Recuit(View):
    def get(View, request):
        c = RecuitmentNews.objects.all()
        context = {"ds": c}
        return render(request, "polls/news.html", context)


class DetailedNew(View):
    def get(View, request, new_id):
        r = RecuitmentNews.objects.get(pk=new_id)
        context = {"new": r}
        return render(request, "polls/detail_new.html", context)

    def post(view, request, new_id):
        r = RecuitmentNews.objects.get(pk=new_id)
        if request.method == "POST":
            created = Application.objects.update_or_create(recuitment_id=r, profile_id=request.user.profile, defaults={
                'recuitment_id': r, 'profile_id': request.user.profile})
            if created:
                messages.info(
                    request, 'Applied successfully! Please hold on for out email!')
            else:
                messages.info(request, 'You have already applied this.')
            return redirect(request.path_info)


def view_data(request):
    c = Company.objects.all()
    context = {"ds": c}
    return render(request, "polls/data.html", context)


def detail_view(request, company_id):
    c = Company.objects.get(pk=company_id)
    r = RecuitmentNews.objects.filter(company=company_id)
    context = {"com": c, "recuit": r}
    return render(request, "polls/detail.html", context)


def logout_(request):
    logout(request)
    messages.success(request, ("See you again!"))
    return redirect('/login/')


def forgot_password(request):
    return render(request, "polls/forgot-password.html")


def register(request):
    form = SignUpForm()
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data['username']
            password = form.cleaned_data['password1']
            user = authenticate(username=username, password=password)
            login(request, user)
            messages.success(request, ("You succesfully register!"))
            return redirect('/')
    return render(request, "polls/register.html", {'form': form})


def hisview(request):
    c = Application.objects.filter(profile_id=request.user.profile)
    context = {"app": c}
    return render(request, "polls/history_view.html", context)


def search(request):
    if request.method == "POST":
        searched = request.POST['searched']
        company_searched = Company.objects.filter(name__contains=searched)
        recuit_search = RecuitmentNews.objects.filter(name__contains=searched)
        return render(
            request, "polls/search_result.html",
            {'searched': searched, 'companys': company_searched, 'recuit': recuit_search}
        )


def qna(request):
    return render(request, "polls/qna.html")


def add_com(request):
    if request.method == "POST":
        form = PostCompany(request.POST, request.FILES)
        if form.is_valid():
            com = form.save(commit=False)
            com.employer = request.user.id
            com.save()
            messages.info(
                request, 'Your profile has been updated!')
        else:
            messages.info(request, 'Opps! Something went wrong!')
        return redirect("/my_com/")
    else:
        form = PostCompany
        return render(request, "polls/add_company.html", {'form': form})


def my_com_list(request):
    coms = Company.objects.filter(employer=request.user.id)
    return render(request, "polls/com_list.html", {'com': coms})


def update_com(request, company_id):
    com = Company.objects.get(pk=company_id)
    form = PostCompany(request.POST or None, request.FILES or None, instance=com)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect("/my_com/")
    return render(request, "polls/update_com.html", {'form': form})


def my_news(request):
    coms = Company.objects.filter(employer=request.user.id)
    news = []
    for i in coms:
        news += RecuitmentNews.objects.filter(company=i)
    return render(request, "polls/my_recuit_news.html", {'news': news})


def applied_profile(request, news_id):
    recuit = RecuitmentNews.objects.get(pk=news_id)
    applied = Application.objects.filter(recuitment_id=recuit)
    return render(request, "polls/applied_pro.html", {'applied': applied})


def show_pro(request, profile_id):
    pro = Profile.objects.get(pk=profile_id)
    return render(request, "polls/show_pro.html", {'pro': pro})


def update_new(request, news_id):
    new = RecuitmentNews.objects.get(pk=news_id)
    form = PostNew(request.POST or None, instance=new)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect("/my_news/")
    return render(request, "polls/update_new.html", {'form': form})


def add_new(request):
    if request.method == "POST":
        form = PostNew(request.POST)
        if form.is_valid():
            form.save()
        return redirect("/my_news/")
    else:
        form = PostNew()
        return render(request, "polls/add_new.html", {'form': form})
