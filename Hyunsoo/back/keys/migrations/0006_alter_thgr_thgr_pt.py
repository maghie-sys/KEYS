# Generated by Django 3.2.6 on 2021-12-24 16:17

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('keys', '0005_auto_20211224_2337'),
    ]

    operations = [
        migrations.AlterField(
            model_name='thgr',
            name='ThGr_pt',
            field=models.IntegerField(validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(5)]),
        ),
    ]
