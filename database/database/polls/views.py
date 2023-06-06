from django.shortcuts import render
from django.http import HttpResponse
from .models import company, application
from .forms import PostProfile
# Create your views here.


def index(request):
    return render(request, "polls/index.html")


def viewdata(request):
    c = company.objects.all()
    context = {"ds": c}
    return render(request, "polls/data.html", context)


def detailview(request, company_id):
    c = company.objects.get(pk=company_id)
    return render(request, "polls/detail.html", {"com": c})


def login(request):
    return render(request, "polls/login.html")


def forgot_password(request):
    return render(request, "polls/forgot-password.html")


def register(request):
    return render(request, "polls/register.html")


def hisview(request):
    c = application.objects.all()
    context = {"app": c}
    return render(request, "polls/history_view.html", context)


def myresume(request):
    a = PostProfile()
    return render(request, "polls/resume.html", {'f': a})


def save_profile(request):
    if request.method == "POST":
        q = PostProfile(request.POST)
        if q.is_valid():
            q.save()
            return HttpResponse("da luu")
        else:
            return HttpResponse("khong luu duoc")
    else:
        return HttpResponse("khong phai post request")
