# -*- coding: utf-8 -*-
# Generated by Django 1.11.11 on 2018-03-23 05:38
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myblog', '0002_navbar'),
    ]

    operations = [
        migrations.AddField(
            model_name='blog',
            name='ishot',
            field=models.BooleanField(default=False, verbose_name='\u70ed\u95e8\u4e13\u9898'),
        ),
    ]
