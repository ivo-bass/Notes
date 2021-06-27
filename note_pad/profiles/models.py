from django.core.validators import MinValueValidator
from django.db import models


class Profile(models.Model):
    first_name = models.CharField(
        max_length=20,
    )
    last_name = models.CharField(
        max_length=20,
    )
    age = models.IntegerField(
        validators=(
            MinValueValidator(1),
        )
    )
    image_url = models.URLField(
    )
