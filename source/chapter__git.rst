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
the adress under clone with https. If you have trouble with the ssl verification, 
refer to the troubleshooting section below.
    
If you want to avoid typing in your credentials for each pull and push, the easiest
solution if using your ``.netrc`` file with the ``git.gerics.de`` server and as describe
by DKRZ here: 

https://www.dkrz.de/up/de-help/de-faq_folder/de-copy_of_faq/how-can-i-use-the-hpss-tape-archive-without-typing-my-password-every-time-e-g-in-scripts-or-jobs

Instead the ``tape.dkrz.de`` you need to use ``git.gerics.de`` and your gitlab credentials.

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

The error message might look like this:

::

    error: SSL certificate problem, verify that the CA cert is OK. Details:
    error:14090086:SSL routines:SSL3_GET_SERVER_CERTIFICATE:certificate verify failed while accessing http://git.gerics.de/.....

Solution 1 (good)
~~~~~~~~~~~~~~~~~
You can download and add the certificate to your git installation. The following instructions are adapted from this post: https://fabianlee.org/2019/01/28/git-client-error-server-certificate-verification-failed/ 

Generally, you can use:

::

    git config --global http.sslVerify true

Detailed instructions

Download certificate:

::

    mkdir ~/config/ca-certificates/
    openssl s_client -showcerts -servername git.gerics.de -connect git.gerics.de:443 </dev/null 2>/dev/null | sed -n -e '/BEGIN\ CERTIFICATE/,/END\ CERTIFICATE/ p'  > ~/config/ca-certificates/git.gerics.de.pem

Use certificate for single-user installation:

::

    git config --global http."https://git.gerics.de/".sslCAInfo ~/config/ca-certificates/git.gerics.de.pem

Which adds to ``.gitconfig``:

::

    [http "https://git.gerics.de/"]
	    sslCAInfo = ~/config/ca-certificates/git.gerics.de.pem

Solution 2 (bad)
~~~~~~~~~~~~~~~~
Try

::

    export GIT_SSL_NO_VERIFY=1
    
or to make a global configuration, use:

::

    git config --global http.sslVerify false
