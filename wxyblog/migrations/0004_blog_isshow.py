# -*- coding: utf-8 -*-
# Generated by Django 1.11.11 on 2018-03-23 05:48
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myblog', '0003_blog_ishot'),
    ]

    operations = [
        migrations.AddField(
            model_name='blog',
            name='isshow',
            field=models.BooleanField(default=True, verbose_name='\u662f\u5426\u53d1\u5e03'),
        ),
    ]
