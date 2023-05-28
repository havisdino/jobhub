from django.shortcuts import render
from django.http import HttpResponse
from .models import company
# Create your views here.
def index(request):
    return render(request,"polls/index.html")

def viewdata(request):
    c = company.objects.all()
    context = {"ds": c}
    return render(request,"polls/data.html",context)

def detailview(request,company_id):
    c = company.objects.get(pk = company_id)
    return render(request,"polls/detail.html",{"com": c})
