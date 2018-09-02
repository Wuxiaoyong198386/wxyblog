# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myblog', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Navbar',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=30, verbose_name='\u540d\u79f0')),
                ('url', models.CharField(max_length=100, null=True, verbose_name='Url')),
                ('blank', models.CharField(max_length=20, verbose_name='\u6253\u5f00\u5c5e\u6027')),
                ('ordernum', models.IntegerField(default=0, verbose_name='\u6392\u5e8f')),
                ('parent', models.ForeignKey(blank=True, to='myblog.Navbar', null=True)),
            ],
            options={
                'verbose_name': '\u5bfc\u822a',
                'verbose_name_plural': '\u5bfc\u822a',
            },
        ),
    ]
