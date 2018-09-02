# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import ckeditor_uploader.fields


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Blog',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=32, verbose_name='\u6807\u9898')),
                ('author', models.CharField(max_length=16, verbose_name='\u4f5c\u8005')),
                ('click_count', models.IntegerField(default=0, verbose_name='\u70b9\u51fb\u6570')),
                ('love_count', models.IntegerField(default=0, verbose_name='\u559c\u6b22')),
                ('keywords', models.CharField(default='', max_length=100, verbose_name='\u5173\u952e\u8bcd')),
                ('description', models.CharField(default='', max_length=200, verbose_name='\u63cf\u8ff0')),
                ('thumb', models.ImageField(default='', upload_to='img', verbose_name='\u7f29\u7565\u56fe')),
                ('content', ckeditor_uploader.fields.RichTextUploadingField()),
                ('pub', models.DateField(auto_now_add=True, verbose_name='\u53d1\u5e03\u65f6\u95f4')),
            ],
            options={
                'verbose_name': '\u535a\u5ba2',
                'verbose_name_plural': '\u535a\u5ba2',
            },
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=30, verbose_name='\u540d\u79f0')),
                ('code', models.CharField(max_length=30, null=True, verbose_name='Code')),
                ('ordernum', models.IntegerField(default=0, verbose_name='\u6392\u5e8f')),
                ('parent', models.ForeignKey(blank=True, to='myblog.Category', null=True)),
            ],
            options={
                'verbose_name': '\u7c7b\u522b',
                'verbose_name_plural': '\u7c7b\u522b',
            },
        ),
        migrations.CreateModel(
            name='Comment',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=16, verbose_name='\u79f0\u547c')),
                ('email', models.EmailField(max_length=254, verbose_name='\u90ae\u7bb1')),
                ('content', models.CharField(max_length=240, verbose_name='\u5185\u5bb9')),
                ('pub', models.DateField(auto_now_add=True, verbose_name='\u53d1\u5e03\u65f6\u95f4')),
                ('blog', models.ForeignKey(verbose_name='\u535a\u5ba2', to='myblog.Blog')),
            ],
            options={
                'verbose_name': '\u8bc4\u8bba',
                'verbose_name_plural': '\u8bc4\u8bba',
            },
        ),
        migrations.CreateModel(
            name='Tag',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=16, verbose_name='\u540d\u79f0')),
            ],
            options={
                'verbose_name': '\u6807\u7b7e',
                'verbose_name_plural': '\u6807\u7b7e',
            },
        ),
        migrations.AddField(
            model_name='blog',
            name='category',
            field=models.ForeignKey(verbose_name='\u5206\u7c7b', to='myblog.Category'),
        ),
        migrations.AddField(
            model_name='blog',
            name='tag',
            field=models.ManyToManyField(to='myblog.Tag', verbose_name='\u6807\u7b7e'),
        ),
    ]
