=======
**GIT**
=======

Useful commands
---------------

Branches
~~~~~~~~

Software branches are used to develop features independently from the
master branch. However, branches should not be used to create additional
versions of a program but should rather be merged into the master quite
regularly. Also a branch should always stay up to date with the master
by merging the master reqularly to stay close to the main software branch.
Be aware, that git is just a tool to develop software together and
track the development. It's not magic, so you neet to stick to a certain
development and merging strategy to make it really work smoothly. Most problems
that you encounter with git are probably no "git problems" but merely a problem
of the development strategy. It you do not stay up to date with what your
fellow developers to, you will definitley run into problems that are not git related.

git.gerics.de
~~~~~~~~~~~~~

The GERICS gitlab is hosted by the HZG which comes with some restrictions. You might
want to clone and push using the https protocol, which means you need to use
the adress under clone with https. You also might need to set your global git configuration
to disable ssl verification, e.g.

::

    git config --global http.sslVerify false
    
If you want to avoid typing in your credentials for each pull and push, the easiest
solution if using your ``.netrc`` file with the ``git.gerics.de`` server and as describe
by DKRZ here: 

https://www.dkrz.de/up/de-help/de-faq_folder/de-copy_of_faq/how-can-i-use-the-hpss-tape-archive-without-typing-my-password-every-time-e-g-in-scripts-or-jobs

For a more comprehensive introduction of how to work with git, you should simply browse 
the web for some introdcution. However, here are some useful features that can come in handy
from time to time that are more uncommon:

List local and remote branches:

::

    git branch -va

Update the local list of remote branches:

::

    git remote update origin --prun

Create a new local branch:

::

    git checkout -b new_branch

Push new local branch to remote origin:

::

    git push origin new_branch

Update local branch:

::

    git pull

Synchronizing a local Git repository with a remote one

::

    git fetch --prune

Tags
~~~~

Tags are used to, well, tag a specific version of the source code. This
can be used to define some definite working versions or to tag a release
version.

Create a tag:

::

    git tag -a my_tag -m "this is my first tag"

Push tag to origin:

::

    git push origin my_tag

Show tag info:

::

    git show my_tag

List tags:

::

    git tag -l

Troubleshooting
---------------

::

    server certificate verification failed

Try

::

    export GIT_SSL_NO_VERIFY=1
    
or to make a global configuration, use:

::

    git config --global http.sslVerify false
