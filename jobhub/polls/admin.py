from django.contrib import admin
from .models import Profile, RecuitmentNew, Application, Company, Catergories


#admin.site.register(profile)
#admin.site.register(recuitment_new)
admin.site.register(Application)
#admin.site.register(company)
admin.site.register(Catergories)

@admin.register(Profile)
class profileAdmin(admin.ModelAdmin):
    list_display = ('first_name','address','phone')
    list_filter = ('dob','country')
    search_fields = ('first_name','phone','address')

@admin.register(RecuitmentNew)
class newAdmin(admin.ModelAdmin):
    list_display = ('name','company','catergory')
    list_filter = ('catergory','name')

@admin.register(Company)
class comAdmin(admin.ModelAdmin):
    list_display = ('name','phone','email')