# Generated by Django 4.1 on 2023-06-20 05:09

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("polls", "0001_initial"),
    ]

    operations = [
        migrations.AddField(
            model_name="company",
            name="employer",
            field=models.IntegerField(default=1, verbose_name="employer"),
        ),
        migrations.AlterField(
            model_name="application",
            name="time",
            field=models.DateTimeField(
                default=datetime.datetime(2023, 6, 20, 12, 9, 55, 532655)
            ),
        ),
    ]