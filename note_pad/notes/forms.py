from django import forms

from note_pad.notes.models import Note
from note_pad.core.form_mixins import AddBootstrapFieldsMixin, DisableFormFieldsMixin


class NoteForm(forms.ModelForm):
    class Meta:
        model = Note
        fields = '__all__'


class AddNoteForm(AddBootstrapFieldsMixin, NoteForm):
    pass


class EditNoteForm(AddBootstrapFieldsMixin, NoteForm):
    pass


class DeleteNoteForm(DisableFormFieldsMixin, AddBootstrapFieldsMixin, NoteForm):
    pass


class DetailsNoteForm(AddBootstrapFieldsMixin, NoteForm):
    pass
