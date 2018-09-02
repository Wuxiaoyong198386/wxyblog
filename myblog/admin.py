# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin

# Register your models here.
# 
# from django.contrib import admin
from .models import *
# Register your models here.
class CategoryAdmin(admin.ModelAdmin):
    list_display = ('name','code','parent','ordernum')

class NavbarAdmin(admin.ModelAdmin):
    list_display = ('name','url','blank','parent','ordernum')


class TagAdmin(admin.ModelAdmin):
    list_display = ('name',)


class BlogAdmin(admin.ModelAdmin):
    list_display = ('title','category','isshow','pub')

class CommentAdmin(admin.ModelAdmin):
    list_display = ('content','name','pub')

class FriendLinkAdmin(admin.ModelAdmin):
    list_display = ('name','url','ordernum')

admin.site.register(Category,CategoryAdmin)
admin.site.register(Navbar,NavbarAdmin)
admin.site.register(Tag,TagAdmin)
admin.site.register(Blog,BlogAdmin)
admin.site.register(Comment,CommentAdmin)
admin.site.register(FriendLink,FriendLinkAdmin)
