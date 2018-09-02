#coding=utf-8
from __future__ import unicode_literals
from django.db import models
from ckeditor.fields import RichTextField
from ckeditor_uploader.fields import RichTextUploadingField
import django.utils.timezone as timezone

# Create your models here.
class Category(models.Model):
    """
    博客分类
    """
    name=models.CharField('名称',max_length=30)
    code=models.CharField('Code',max_length=30,null=True)
    parent=models.ForeignKey('self',blank=True,null=True)
    ordernum=models.IntegerField('排序',default=0)
    class Meta:
        verbose_name="类别"
        verbose_name_plural=verbose_name
    def __unicode__(self):
        return self.name

class Tag(models.Model):
    name=models.CharField('名称',max_length=16)

    class Meta:
        verbose_name="标签"
        verbose_name_plural=verbose_name
    def __unicode__(self):
        return self.name

class Blog(models.Model):
    title=models.CharField('标题',max_length=32)
    author=models.CharField('作者',max_length=16)
    click_count=models.IntegerField('点击数',default=0)
    love_count=models.IntegerField('喜欢',default=0)

    keywords=models.CharField('关键词',max_length=100,default='')
    description=models.CharField('描述',max_length=200,default='')
    thumb=models.ImageField('缩略图',upload_to='img',default='')

    content=RichTextUploadingField(config_name='custom')    
    pub=models.DateField('发布时间',auto_now_add=True)
    category=models.ForeignKey(Category,verbose_name='分类')#多对一（博客--类别）
    tag=models.ManyToManyField(Tag,verbose_name='标签')#(多对多）
    ishot=models.BooleanField('热门专题',default=False)
    isshow=models.BooleanField('是否发布',default=True)
    class Meta:
        verbose_name="博客"
        verbose_name_plural=verbose_name

    def __unicode__(self):
        return self.title

class Comment(models.Model):
    blog_id=models.IntegerField('博客_id',default=0)#(博客--评论:一对多)
    name=models.CharField('称呼',max_length=16)
    email=models.EmailField('邮箱')
    url=models.CharField('网址',max_length=100,default='')
    content=models.CharField('内容',max_length=240)
    pub=models.DateTimeField('发布时间',default = timezone.now)
    parent_id=models.IntegerField('parend_id',blank=True,null=True)
    class Meta:
        verbose_name="评论"
        # verbose_name_plural="评论"
    def __unicode__(self):
        return self.content

class Navbar(models.Model):
    name=models.CharField('名称',max_length=30)
    url=models.CharField('Url',max_length=100,null=True)
    blank=models.CharField('打开属性',max_length=20,blank=False)
    parent=models.ForeignKey('self',blank=True,null=True)
    ordernum=models.IntegerField('排序',default=0)
    class Meta:
        verbose_name="导航"
        verbose_name_plural=verbose_name
    def __unicode__(self):
        return self.name


class FriendLink(models.Model):
    name=models.CharField('名称',max_length=30)
    url=models.CharField('Url',max_length=100,null=True)
    ordernum=models.IntegerField('排序',default=0)
    class Meta:
        verbose_name="友情链接"
        verbose_name_plural=verbose_name
    def __unicode__(self):
        return self.name