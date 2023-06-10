from django.db import models
from django.utils import timezone


class profile(models.Model):
    first_name = models.CharField(max_length=20)
    last_name = models.CharField(max_length=20)
    email = models.EmailField(max_length=100)
    dob = models.DateTimeField()
    phone = models.CharField(max_length=10)
    address = models.CharField(max_length=100)
    country = models.CharField(max_length=50,blank=True)
    facebook = models.URLField(max_length=200,blank=True)
    description_text = models.TextField(max_length=500)
    
    def __str__(self):
        return self.first_name


class company(models.Model):
    name = models.CharField(max_length=20)
    email = models.EmailField(max_length=100)
    phone = models.CharField(max_length=10)
    field = models.CharField(max_length=20)
    description_text = models.TextField(max_length=500, null=True)


    def __str__(self):
        return self.name

class recuitment_new(models.Model):
    company_id = models.ForeignKey(company, on_delete=models.CASCADE)
    name = models.CharField(max_length=50)
    job_descrip = models.CharField(max_length=500)
    job_demand = models.CharField(max_length=500)

    def __str__(self):
        return self.job_descrip
    
class application(models.Model):
    recuitment_id = models.ForeignKey(recuitment_new, on_delete=models.CASCADE)
    profile_id = models.ForeignKey(profile, on_delete=models.CASCADE)
    time = models.DateTimeField(default=timezone.datetime.now())
    xxx = models.CharField(max_length=10, null=True)
