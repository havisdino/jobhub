from django.contrib import admin
from django.urls import path,include
from . import views
urlpatterns = [
    path("",views.classIndex.as_view(),name="index"),
    path("data/",views.view_data,name = "data"),
    path("detail/<int:company_id>",views.detailview,name = "detailview"),
    path("login/",views.Weblogin.as_view(),name = "login"),
    path("forgot_password/",views.forgot_password,name ="forgot"),
    path("register/",views.register,name="register"),
    path("applications/",views.hisview,name = "hisview"),
    path("tmp_resume/",views.tmp.as_view(),name="resume"),
    path("news/",views.recuit.as_view(),name='news'),
    path("new/detail/<int:new_id>",views.detail_new.as_view(),name="new_detail")
]