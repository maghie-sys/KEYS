from django.contrib import admin
from .models import Er, ErAd, Th, ThGr, ThPic


# Register your models here.

admin.site.register(Er)
admin.site.register(ErAd)
#admin.site.register(Th)
admin.site.register(ThGr)
admin.site.register(ThPic)

class ThPicInline(admin.TabularInline):
    model = ThPic
    extra = 1

class ThAdmin(admin.ModelAdmin):
    inlines = [ThPicInline]
    def save_model(self, request, obj, form, change):
        obj.save()
        for afile in request.FILES.getlist('Th_pic'):
            obj.photos.create(Th_pic=afile)

admin.site.register(Th, ThAdmin)