from django import forms
from .models import profile

class PostProfile(forms.ModelForm):
    class Meta:
        model = profile
        fields = {'first_name','last_name','dob','email','phone','address','description_text'}
        widgets = {
            'first_name' : forms.TextInput(attrs={'class': "input"}),
            'last_name' : forms.TextInput(attrs={'class': "input"}),
            'dob' : forms.DateInput(format=('%d-%m-%Y'),attrs={'class': "input"}),
            'email' : forms.TextInput(attrs={'class': "input"}),
            'phone' : forms.TextInput(attrs={'class': "input"}),
            'address': forms.TextInput(attrs={'class': "input"}),
            'description_text': forms.Textarea(attrs={'class':"input01"})
        }