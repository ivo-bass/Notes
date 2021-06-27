from django.shortcuts import render, redirect

from note_pad.notes.forms import AddNoteForm, EditNoteForm, DeleteNoteForm, DetailsNoteForm
from note_pad.notes.models import Note
from note_pad.profiles.forms import AddProfileForm
from note_pad.profiles.models import Profile


def home_no_profile(request):
    if request.method == 'POST':
        form = AddProfileForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('home')
    else:
        form = AddProfileForm()
    context = {
        'form': form,
    }
    return render(request, 'home-no-profile.html', context)


def home_with_profile(request):
    notes = Note.objects.all()
    context = {
        'notes': notes,
    }
    return render(request, 'home-with-profile.html', context)


def home(request):
    profile = Profile.objects.first()
    if not profile:
        return home_no_profile(request)
    return home_with_profile(request)


def add_note(request):
    if request.method == 'POST':
        form = AddNoteForm(request.POST)
        if form.is_valid():
            return save_form(form, 'home')
    else:
        form = AddNoteForm()
    context = {
        'form': form,
    }
    return render(request, 'note-create.html', context)


def edit_note(request, pk):
    note = Note.objects.get(pk=pk)
    if request.method == 'POST':
        form = EditNoteForm(request.POST, instance=note)
        if form.is_valid():
            return save_form(form, 'home')
    else:
        form = EditNoteForm(instance=note)
    context = {
        'form': form,
    }
    return render(request, 'note-edit.html', context)


def delete_note(request, pk):
    note = Note.objects.get(pk=pk)
    if request.method == 'POST':
        note.delete()
        return redirect('home')
    form = DeleteNoteForm(instance=note)
    context = {
        'form': form,
    }
    return render(request, 'note-delete.html', context)


def details_note(request, pk):
    note = Note.objects.get(pk=pk)
    context = {
        'note': note,
    }
    return render(request, 'note-details.html', context)


def save_form(form, url_name):
    form.save()
    return redirect(url_name)