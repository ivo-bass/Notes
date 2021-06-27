from django.urls import path

from note_pad.profiles.views import details_profile, delete_profile

urlpatterns = [
    path('', details_profile, name='details profile'),
    path('delete/', delete_profile, name='delete profile'),
]
