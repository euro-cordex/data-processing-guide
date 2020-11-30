=======
**GIT for beginners**
=======

First steps
---------------
When you start a new projekt and new directory, 
always use git from the first day 
an overview on many git commands can be found here:
::
    https://git-scm.com/doc


getting started
~~~~~~~~
Initialize your directory

::
    git init


Always have a look what the status of your directory is:

::
    git status

Read what appears on the sceen, e.g. add new files
::
    git add newfile

First time , when you use git you have to set up some configurations
(This could be different if you use git.gerics.de)

type
::
    git commit
   
follow command on sceen e.g.:
::
     git config --global user."you@example.com"
     git config --global user.name "Your Name"


A commit message ("text") should always have 50 signs, it should shortly describe, what is new in the code. If you like to add a long comment you can add extra text bei starting with " text return return more text"
::
    git commit -m "text"

You can restore and rm (remove) mv (rename) files.

Information about your last commits:

::
    git log  

If you like it in a short way

::
    git log --oneline

(you can always use tab to fill up the command)

If the file already exsists and has only been change you can use only one line

::
   commit-am "text"

Error occurs, if you have added two files with the same name.
compare the files with
::
     git diff
If you are sure, you only want to add the new file, do git add again
You want to see the difference of the file to the one in the repository
::
git diff --stage ()

if you like more information on your file, eg. autor, commiter ..
::
    git log --oneline
take the 'number', which occurs on the screen
::
    git cat-file -p number

Your file information ist stored in
./git/objects/

## Branch
Branch Marke erzeugen
git branch testing 
./git/refs/heads


Banches
~~~~

Create 'pointer' to branch
::
    git branch testing

files are store in ./git/refs/heads
