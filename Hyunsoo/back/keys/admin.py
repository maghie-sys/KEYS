from django.contrib import admin
from .models import Er, Th, ThGr, ThImg, ErImg, ThGrImg


# Register your models here.

admin.site.register(Er)
admin.site.register(Th)
admin.site.register(ThGr)
admin.site.register(ThImg)
admin.site.register(ErImg)
admin.site.register(ThGrImg)

"""
class ThPicInline(admin.TabularInline):
    model = ThImg
    extra = 1

class ThAdmin(admin.ModelAdmin):
    inlines = [ThPicInline]
    def save_model(self, request, obj, form, change):
        obj.save()
        for afile in request.FILES.getlist('Th_img'):
            obj.photos.create(Th_img=afile)
"""

#admin.site.register(Th, ThAdmin)
