#! /bin/sh

echo "
Hello to Django Project-Maker 1.0

"

# shellcheck disable=SC2039
echo -e "\e[1;31m Write a name for main directory of your project \e[0m"
# shellcheck disable=SC2162
read dirname
mkdir "$dirname"
echo "
Directory '$dirname' was created!
"
# shellcheck disable=SC2164
cd "$dirname"

echo "
Creating virtual environment 'venv'...
"
python3 -m venv venv
echo "Done"

# shellcheck disable=SC2039
source venv/bin/activate
echo "
Venv is activated!
"

echo "
Upgrading pip...
"
python3 -m pip install --upgrade pip

echo "
Installing Django...
"
python3 -m pip install django

echo "
Installing psycopg2...
"
python3 -m pip install psycopg2

echo " "
# shellcheck disable=SC2039
echo -e "
\e[1;31m Write name for your project \e[0m"
# shellcheck disable=SC2162
read projectname
echo "
Creating $projectname Django project...
"
django-admin startproject "$projectname" .
echo "
Project '$projectname' is created!
"

echo " "
# shellcheck disable=SC2039
echo -e "
\e[1;31m Write name for your first app \e[0m"
# shellcheck disable=SC2162
read firstapp

echo "
Creating '$firstapp' app INSIDE '$projectname' directory...
"
python3 manage.py startapp "$firstapp"


mkdir ./templates
echo "
Templates dir made.
"
mkdir ./templates/shared
echo "
templates/shared dir made.
"
echo "
{% load static %}

<!DOCTYPE html>
<html lang="en">
{% include 'shared/head.html' %}

<body>
{% include 'shared/navbar.html' %}

{% block body %}
    If you see this something went wrong...
{% endblock %}

</body>

{% include 'shared/footer.html' %}
</html>
" > ./templates/shared/base.html

echo "
{% load static %}

" > ./templates/shared/footer.html

echo "
{% load static %}

" > ./templates/shared/navbar.html

echo "
{% load static %}

<head>

</head>
" > ./templates/shared/head.html


mkdir ./static
echo "
Static dir made.
"

echo "from django import forms


# Create your forms class here
" > ./"$projectname"/"$firstapp"/forms.py
echo "
forms.py file made.
"

echo "from django.urls import path


urlpatterns = []
" > ./"$projectname"/"$firstapp"/urls.py
echo "
urls.py file made.
"

echo "
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('$projectname.$firstapp.urls')),
]
" > ./"$projectname"/urls.py
echo "
main urls file refactored.
"

echo"
from django.apps import AppConfig


class NotesConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = '$projectname.$firstapp'
" > ./"$projectname"/"$firstapp"/apps.py
echo "
apps file refactored.
"

cp ../exam_project_creator.sh ./exam_project_creator.sh


echo "
Added templates dirs and STATICFILES_DIRS to settings.py
"
echo "

TEMPLATES['DIRS'] = [BASE_DIR / 'templates']

STATICFILES_DIRS = [BASE_DIR / 'static']
" >> ./"$projectname"/settings.py


echo "Starting initial migrations..."
python3 manage.py makemigrations
python3 manage.py migrate
echo "Done"

# shellcheck disable=SC2039
echo -e "\e[1;31m Creating .gitignore... \e[0m"
# shellcheck disable=SC2129
echo "venv" >> .gitignore
echo ".vscode" >> .gitignore
echo ".idea/" >> .gitignore
echo "__pycache__" >> .gitignore

# shellcheck disable=SC2039
echo -e "\e[1;31m Creating README... \e[0m"
# shellcheck disable=SC2129
echo "
# $projectname

This project is instantiated by my shell script which:
1. Creates venv
2. Installs Django
3. Starts project
4. Creates app OUTSIDE the project
5. Creates .gitignore
6. Creates README
7. Creates requirements
8. Creates local git repo, adds all and does init commit
9. Makes 'templates' dir
10. Adds Tests Skeleton
11. Adds STATICFILES_DIRS to settings.py
12. Adds Templates dirs to settings.py
13. Adds forms.py
14. Adds urls.py


!!! I NEED TO MAKE THE FOLLOWING CHANGES AFTER OPENING PYCHARM:
1. Edit run configuration in PyCharm - set the starting point and add the venv!
2. In settings.py I need to add     '$projectname.$firstapp',    to INSTALLED_APPS list!
3. Mark templates folder as templates folder!
4. Replace sqlite with postgres!

***Script by Ivailo Ignatov - IvoBass***
" >> README.md

echo "Creating requirements.txt"
python3 -m pip freeze > requirements.txt

echo "Initializing git repo..."
git init
git add .
git commit -m "initial commit"


echo "

All set!
PyCharm will open."

# shellcheck disable=SC2039
echo -e "

\e[1;31m !!! OPEN README.md TO FINALIZE SETUP !!! \e[0m
"
echo "

Hit ENTER to open project in Pycharm
"
# shellcheck disable=SC2034
# shellcheck disable=SC2162
read start

charm ../"$dirname"
