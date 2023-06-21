from typing import Any, Dict, Mapping, Optional, Type, Union
from django import forms
from django.core.files.base import File
from django.db.models.base import Model
from django.forms.utils import ErrorList
from .models import profile, company


class PostProfile(forms.ModelForm):
    class Meta:
        model = profile
        fields = {'first_name','last_name','dob','email','phone','address','description_text','country','facebook'}
        widgets = {
            'first_name': forms.TextInput(attrs={'class': "input"}),
            'last_name': forms.TextInput(attrs={'class': "input"}),
            'dob': forms.DateInput( attrs={'class': "input"}),
            'email': forms.TextInput(attrs={'class': "input"}),
            'phone': forms.TextInput(attrs={'class': "input"}),
            'address': forms.TextInput(attrs={'class': "input"}),
            'description_text': forms.Textarea(attrs={'class':"input01"}),
            'country': forms.TextInput(attrs={'class': "input"}),
            'facebook': forms.URLInput(attrs={'class': "input"})
        }


class PostCompany(forms.ModelForm):
    class Meta:
        model = company
        fields = {'name','email','phone','field','description_text'}
        widgets = {
            'name': forms.TextInput(attrs={'class': "form-control"}),
            'email': forms.EmailInput(attrs={'class': "form-control"}),
            'phone': forms.TextInput(attrs={'class': "form-control"}),
            'field': forms.TextInput(attrs={'class': "form-control"}),
            'description_text': forms.Textarea(attrs={'class': "form-control"}),
        }

# class postProfile(forms.Form):
#     first_name = forms.CharField(max_length=100,widget=forms.TextInput(attrs={'class': "input"}))
#     last_name = forms.CharField(max_length=100,widget=forms.TextInput(attrs={'class': "input"}))
#     dob = forms.DateField(widget=forms.DateInput(attrs={'class': "input"}))
#     email = forms.EmailField(widget=forms.EmailInput(attrs={'class': "input"}))
#     phone = forms.CharField(widget=forms.TextInput(attrs={'class': "input"}))
#     address = forms.CharField(max_length=100,widget=forms.TextInput(attrs={'class': "input"}))
#     description_text = forms.CharField(widget=forms.Textarea(attrs={'class': "input01"}))
#     country = forms.CharField(widget=forms.TextInput(attrs={'class': "input"}))
#     facebook = forms.URLField(widget=forms.URLInput(attrs={'class': "input"}))