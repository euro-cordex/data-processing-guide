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
by merging the master reqularly to stay close the main software branch.

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
