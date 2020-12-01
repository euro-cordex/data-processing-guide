=======
**GIT for beginners**
=======

First steps
---------------
When you start a new projekt and new directory, 
always use git from the first day.
It helps to reproduce your code. You probably need to publish your code at some stage, to be able to cite ist probably. Git makes it possible to work at the same time with a few people on the code. Git also saves your code and makes your changes traceable.

An overview on many git commands can be found here:
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

Commit early and often !
You can restore and rm (remove) mv (rename) files.

Information about your last commits:
::
    git log  

If you like it in a short way
::
    git log --oneline

(you can always use tab to fill up the command)

If the file already exsists and has only been change, you can use only one line
::
    commit -am "text"

Error occurs, if you have added two files with the same name.
You can compare the files with
::
    git diff

If you are sure, you only want to add the new file, do 'git add' again.

You want to see the difference of the file to the one in the repository:
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

Banches
~~~~

Create branch
::
    git branch testing
    git checkout testing
or in oneline both commands together 
::
    git checkout -b testing 

merge branch

you have to be in master 'git checkout master'
::
    git merge testing 'text'

If you want to see what is going on:
::
    git log --oneline --all --graph --decorate
or
::
    git reflog

If a merge conflict occurs 
::
   git merge --abort 

you have to edit the 'conflict' file(s) by hand. Afterwards 'git add' 
the corrected file again followed by a commit.

You can put a tag to your Branch 
::
    git tag 1.0.0 
    more information: https://semver.org/


Create alias
~~~~
create alias:
::
    git config --global alias.graph "log --oneline --all --graph"
    git graph



