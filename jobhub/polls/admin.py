from django.contrib import admin
from .models import profile, recuitment_new, application, company, catergories


#admin.site.register(profile)
#admin.site.register(recuitment_new)
admin.site.register(application)
#admin.site.register(company)
admin.site.register(catergories)

@admin.register(profile)
class profileAdmin(admin.ModelAdmin):
    list_display = ('first_name','address','phone')
    list_filter = ('dob','country')
    search_fields = ('first_name','phone','address')

@admin.register(recuitment_new)
class newAdmin(admin.ModelAdmin):
    list_display = ('name','company','catergory')
    list_filter = ('catergory','name')

@admin.register(company)
class comAdmin(admin.ModelAdmin):
    list_display = ('name','phone','email')