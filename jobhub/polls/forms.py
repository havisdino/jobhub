from typing import Any, Dict, Mapping, Optional, Type, Union
from django import forms
from django.core.files.base import File
from django.db.models.base import Model
from django.forms.utils import ErrorList
from django.contrib.auth.models import User
from .models import Profile, Company, RecuitmentNew
from django.contrib.auth.forms import UserCreationForm


class PostProfile(forms.ModelForm):
    class Meta:
        model = Profile
        fields = {'first_name', 'last_name', 'dob', 'email', 'phone',
                  'address', 'description_text', 'country', 'facebook', 'img'}
        widgets = {
            'first_name': forms.TextInput(attrs={'class': "input"}),
            'last_name': forms.TextInput(attrs={'class': "input"}),
            'dob': forms.DateInput(attrs={'class': "input"}),
            'email': forms.TextInput(attrs={'class': "input"}),
            'phone': forms.TextInput(attrs={'class': "input"}),
            'address': forms.TextInput(attrs={'class': "input"}),
            'description_text': forms.Textarea(attrs={'class': "input01"}),
            'country': forms.TextInput(attrs={'class': "input"}),
            'facebook': forms.URLInput(attrs={'class': "input"})
        }


class PostCompany(forms.ModelForm):
    class Meta:
        model = Company
        fields = {'name', 'email', 'phone', 'field',
                  'description_text', 'company_img'}
        widgets = {
            'name': forms.TextInput(attrs={'class': "form-control"}),
            'email': forms.EmailInput(attrs={'class': "form-control"}),
            'phone': forms.TextInput(attrs={'class': "form-control"}),
            'field': forms.TextInput(attrs={'class': "form-control"}),
            'description_text': forms.Textarea(attrs={'class': "content form-control"}),
        }


class PostNew(forms.ModelForm):
    class Meta:
        model = RecuitmentNew
        fields = {'company', 'catergory', 'name', 'job_descrip', 'job_demand'}
        widgets = {
            'name': forms.TextInput(attrs={'class': "form-control"}),
            'catergory': forms.Select(attrs={'class': "form-select"}),
            'company': forms.Select(attrs={'class': "form-select"}),
            'job_descrip': forms.Textarea(attrs={'class': "form-control"}),
            'job_demand': forms.Textarea(attrs={'class': "form-control"})
        }


class SignUpForm(UserCreationForm):
    class Meta:
        model = User
        fields = {'username', 'password1', 'password2'}

    def __init__(self, *args: Any, **kwargs):
        super(SignUpForm, self).__init__(*args, **kwargs)

        self.fields['username'].widget.attrs['class'] = 'form-control form-control-user'
        self.fields['username'].widget.attrs['placeholder'] = 'User Name'
        self.fields['username'].label = ''
        self.fields['username'].help_text = '<span class="form-text text-muted"><small>Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.</small></span>'

        self.fields['password1'].widget.attrs['class'] = 'form-control form-control-user'
        self.fields['password1'].widget.attrs['placeholder'] = 'Password'
        self.fields['password1'].label = ''
        self.fields['password1'].help_text = '<ul class="form-text text-muted small"><li>Your password can\'t be too similar to your other personal information.</li><li>Your password must contain at least 8 characters.</li><li>Your password can\'t be a commonly used password.</li><li>Your password can\'t be entirely numeric.</li></ul>'

        self.fields['password2'].widget.attrs['class'] = 'form-control form-control-user'
        self.fields['password2'].widget.attrs['placeholder'] = 'Confirm Password'
        self.fields['password2'].label = ''
        self.fields['password2'].help_text = '<span class="form-text text-muted"><small>Enter the same password as before, for verification.</small></span>'
