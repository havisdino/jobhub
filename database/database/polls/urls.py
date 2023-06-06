from django.contrib import admin
from django.urls import path, include
from . import views
urlpatterns = [
    path("", views.index, name="index"),
    path("data/", views.viewdata, name="data"),
    path("detail/<int:company_id>", views.detailview, name="detailview"),
    path("login/", views.login, name="login"),
    path("forgot_password/", views.forgot_password, name="forgot"),
    path("register/", views.register, name="register"),
    path("applications/", views.hisview, name="hisview"),
    path("myresume/", views.myresume, name="resume"),
    path("save/", views.save_profile, name='save')
]
