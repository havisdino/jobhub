from django.db import models
from django.utils import timezone
from django.conf import settings
import datetime

class profile(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL,on_delete=models.CASCADE)
    first_name = models.CharField(max_length=20)
    last_name = models.CharField(max_length=20)
    email = models.EmailField(max_length=100)
    dob = models.DateField(default=datetime.date.today)
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
    employer = models.IntegerField('employer',blank = False,default=1)

    def __str__(self):
        return '{}.{}'.format(self.id,self.name)

class catergories(models.Model):
    name = models.CharField(max_length=100)
    
    def __str__(self):
        return self.name
    
class recuitment_new(models.Model):
    company = models.ForeignKey(company,on_delete=models.SET_NULL,blank=True,null= True)
    catergory = models.ForeignKey(catergories,on_delete=models.CASCADE)
    name = models.CharField(max_length=50)
    job_descrip = models.CharField(max_length=500)
    job_demand = models.CharField(max_length=500)

    def __str__(self):
        return self.name
    
class application(models.Model):
    recuitment_id = models.ForeignKey(recuitment_new, on_delete=models.CASCADE)
    profile_id = models.ForeignKey(profile, on_delete=models.CASCADE)
    time = models.DateTimeField(default=timezone.datetime.now())
    xxx = models.CharField(max_length=10, null=True)

    def __str__(self) :
        return  self.recuitment_id.name
