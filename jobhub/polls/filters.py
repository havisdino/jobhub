import django_filters
from .models import *
from django_filters import DateFilter
from django import forms
class NewFilter(django_filters.FilterSet):
    start_date = DateFilter(field_name='posted_at', lookup_expr='gte')
    
    class Meta:
        model = RecruitmentNews
        fields = '__all__'
        exclude = ['job_demand','job_descrip','name','posted_at']