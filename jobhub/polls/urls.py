from django.contrib import admin
from django.urls import path, include
from . import views


urlpatterns = [
    path("", views.Index.as_view(), name="index"),
    path("data/", views.view_data, name="data"),
    path("detail/<int:company_id>", views.detail_view, name="detail_view"),
    path("login/", views.WebLogin.as_view(), name="login"),
    path("forgot_password/", views.forgot_password, name="forgot"),
    path("register/", views.register, name="register"),
    path("applications/", views.hisview, name="hisview"),
    path("tmp_resume/", views.TMP.as_view(), name="resume"),
    path("news/", views.Recuit.as_view(), name='news'),
    path("new/detail/<int:new_id>", views.DetailedNew.as_view(), name="new_detail"),
    path("search_result/", views.search, name="search"),
    path("Q&A/", views.qna, name='qna'),
    path("add_company/", views.add_com, name="add_com"),
    path("add_new/", views.add_new, name="add_new"),
    path("my_com/", views.my_com_list, name="my_com"),
    path("update/<int:company_id>", views.update_com, name="update_com"),
    path("my_news/", views.my_news, name="my_news"),
    path("news/<int:news_id>/applied", views.applied_profile, name="applied"),
    path("profile/<int:profile_id>", views.show_pro, name="show_pro"),
    path("my_news/<int:news_id>/update/", views.update_new, name="update_new"),
    path("logout", views.logout_, name="logout")
]
