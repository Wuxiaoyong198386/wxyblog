# -*- coding: utf-8 -*-
# Generated by Django 1.11.11 on 2018-03-30 07:48
from __future__ import unicode_literals

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('myblog', '0005_auto_20180329_1727'),
    ]

    operations = [
        migrations.AlterField(
            model_name='comment',
            name='pub',
            field=models.DateTimeField(default=django.utils.timezone.now, verbose_name='\u53d1\u5e03\u65f6\u95f4'),
        ),
    ]
