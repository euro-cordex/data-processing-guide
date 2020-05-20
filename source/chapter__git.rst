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

However, here are some useful features that can come in handy:

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
