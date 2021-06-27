from django.shortcuts import render, redirect

from note_pad.notes.models import Note
from note_pad.profiles.models import Profile


def details_profile(request):
    profile = Profile.objects.first()
    notes_count = len(Note.objects.all())
    context = {
        'profile': profile,
        'notes_count': notes_count,
    }
    return render(request, 'profile.html', context)


def delete_profile(request):
    profile = Profile.objects.first()
    if request.method == 'POST':
        profile.delete()
        Note.objects.all().delete()
        return redirect('home')
    return render(request, 'profile-delete.html')
