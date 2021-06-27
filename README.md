# note_pad

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
1. Edit run configuration in PyCharm - set the starting point and add the venv.
2. In settings.py I need to add     'note_pad.notes',    to INSTALLED_APPS list.
3. Mark templates folder as templates folder

***Script by Ivailo Ignatov - IvoBass***