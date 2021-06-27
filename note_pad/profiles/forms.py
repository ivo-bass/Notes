from django import forms

from note_pad.profiles.models import Profile
from note_pad.core.form_mixins import AddBootstrapFieldsMixin, DisableFormFieldsMixin


class ProfileForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = '__all__'


class AddProfileForm(ProfileForm):
    pass


class EditProfileForm(ProfileForm):
    pass


class DeleteProfileForm(ProfileForm):
    pass


class DetailsProfileForm(ProfileForm):
    pass
