Configuration
=============

This simply means that you should split all input configurations from
the rest of the program. I have seen this very often, e.g., having user
specific pathes in your script which nobody else hase permission to use.
In general, *everything that you will have to change in the script if
you resuse it with some other input data should be removed from the
script and put into a configuraiton file*. For example, in a shell
script you can achieve this quite easily if you create a ``config.sh``
file that defines all variables used and sourced in the main program.
Imagine you want to do some data processing on a directory and write the
results to an output directory. The ``config.sh`` file could look like
this

::

    #!/usr/bash
    DATDIR=${WORK}/data     # This is the input data directory
    OUTDIR=${WORK}/results  # Here you will find results that are copied

In the main script, e.g ``copy_data.sh`` you can then source this
configuration file very easily:

::

    #!/usr/bash
    source config.sh
    # go and do something...
    cp ${DATDIR}/* ${OUTDIR}

There you go. Now you can create different configuration files for
different input data sets and reuse your main script without adapting
it. It you think about this, you will quickly recognize what should be
part of the configuration and what is part of the actual program code.
Another big advantage of this is, that you can work together with others
on the functionalities using version control like ``git``. Imagine
someone uses your scripts, finds a bug, removes it and commits it to the
programs' repository. If you have user specific configurations in the
main script, these will be changed with every commit and somebody else
will get into trouble if he or she wants to pull the bugfixes. Instead,
moving user specific configurations from the script to a configuration
file will leave all user specific input untouced. Even better, if you
want to share your configuration, all you have to do is to exchange
configuration files. You can also parse configuration files to your main
script like this:

::

    #!/usr/bash
    configfile=$1
    source ${configfile}
    # go and do something...
    cp ${DATDIR}/* ${OUTDIR}

and excute it, e.g.:

::

    bash copy_data.sh config.sh

If you use ``python``, it is even more simple, since python offers lots
of functionalities to maintain different kinds of configuration syntax,
e.g., ``yaml`` or ``ini`` files. Python also has the big advantage, that
it provides ``namespaces`` which are very hard to do in bash scripts
(and should not be done anyway). This means, that all variables that you
define in a bash script or that you define by sourcing other files (like
config files or more sophisticated tools scripts) will be in the global
namespace of the scripts. In other words, you need to keep track of all
your variables and take care not to accidentially overwrite them.

Let's now have a look at an example of how to use config files in
python, we will show an example of how to read a file in ``.ini``
format. Here is the ``config.ini`` file:

::

    [data]
    DATDIR = /work/data     # This is the input data directory
    OUTDIR = /work/results  # Here you will find results that are copied

and here an example of how to read it:

::

    #!/usr/bin/env python
    from configobj import ConfigObj
    my_config = ConfigObj('config.ini')
    datdir  = my_config['DATDIR']
    outtdir = my_config['OUTDIR']

In general, it is a good idea to avoid hardcoding information as much as
possible. You should, e.g., avoid hardcoding cf-variable names into the
script. Instead, it's a better idea to extract this information to an
external file or module which can be accessed by your script. In python,
a dictionary that is read from an .ini file is a good way to do this. If
you have several variables that your script should work on, you can then
make up a list of these variables and let the script do the work. I have
seen a lot of awful long if statements that check for certain hardcoded
variable names until it found a special treatment for this variable. If
another variable is added, the code probably has to be changed in
several places to account for the new variables. Using list and
dictionaries, the variable only has to be added in a central place and
the script will simply make another loop through the program by itself.
If a variable requires a special procedure to or computation, you can
even make up a subroutine for this and simply define it in your
dictionary.
