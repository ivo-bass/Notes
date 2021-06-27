from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('note_pad.notes.urls')),
    path('profile/', include('note_pad.profiles.urls')),
]
