Design
======

Usually we start writing a script or program by exploring ways of
computing something or how to process some data to get some useful
results. I think this is normal and a scientist is not used and also not
required to have a proper design of his software in mind all the time.

**But you should keep in mind that others might want to use your program!**

This aspect of scientific software engineering is always underrated. But especially
in the climate sciences this is quite surprising since in these
disciplines, a close connection to the public, stakeholders and other
non scientists is usually well appreciated to communicate current
results from climate sciences as well as advance mitigation and adpation
to climate change. Here, climate scientist usually know very well what
their users require and they have learned to process data in a way that
can be understood in the public.\\ Nevertheless, as long as the data
stays in the lab or the institute, it is not processed with the same
care as when it is published. Although the published results are well
described and documented, the required codes and programs for creating
these results are not.

Design Principles
-----------------

Even if you only want to reuse scripts yourself it is often very helpful
if you spent some time planning and designing your scripts. In practice,
I think that you should not plan too much in advance but rather revisit
your code at the moment where you have a rough idea of how the script's
functionalities should be implemented. At this point, you should have a
rough idea of what patterns appear in your code and how you can create a
powerful tool from your running script.

I think some of the most often underrated but very powerful concepts
are:

-  split configuration from functionalites
-  modularized code
-  documentation
-  command line interfaces (like python argpars)
-  itemize

So let's quickly start with some more details on these concepts, in the
later chapters you can find more details on how to create *sustainable*
software.

Split up your code!
-------------------

::

        It does't matter if you write shell scripts or
        python modules and packages. You should always think 
        about how you can split up your task into small pieces
        that are frequently reused. Make up a file or module
        and collect pieces of the code that logically fit together.

Use configuration files!
------------------------

::

        You will need to configure your program, so put this into
        an external configuration file. If you have to reconfigure
        your program, you only change configuration. Configuration 
        files can also be used to store permanent data that is reused
        frequently, e.g., grid configurations, input data, variable
        definitions, etc... Make up several config files that can be
        used in any cross combination neccessary.

Use templates!
--------------

::

        Templating is very powerful concept. If you have to create
        input files for a lot of tasks, make a template and fill it
        using a function. Templates can also be used to create
        jobscripts for reaccuring tasks and parallelize your program.
        You can also use templating to create config files.

Use a command line interface!
-----------------------------

::

        Create a command line interface for your tool where you can
        parse configuration files and options to your code. Document
        the command line to remember how to use your code and check
        if the arguments make sense.

Check for sanity!
-----------------

::

        Check frequently and tell the user, if anything went wrong.
        Check if files, that are needed, actually exists. Check if
        configurations make sense and tell the user what he did wrong.
        Be verbose.

:cite:`Barnes2010` 
:cite:`Merali2010`
:cite:`Miller2006`

From :cite:`Wilson2014`

Summary of Best Practices\*
---------------------------

Write programs for people, not computers.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

::

        A program should not require its readers to hold 
        more than a handful of facts in memory at once.
        Make names consistent, distinctive, and meaningful.
        Make code style and formatting consistent.

Let the computer do the work.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

::

        Make the computer repeat tasks.
        Save recent commands in a file for re-use.
        Use a build tool to automate workflows.

Make incremental changes.
~~~~~~~~~~~~~~~~~~~~~~~~~

::

        Work in small steps with frequent feedback and 
        course correction. Use a version control system.
        Put everything that has been created manually in 
        version control.

Don't repeat yourself (or others).
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

::

        Every piece of data must have a single authoritative 
        representation in the system.
        Modularize code rather than copying and pasting.
        Re-use code instead of rewriting it.

Plan for mistakes.
~~~~~~~~~~~~~~~~~~

::

        Add assertions to programs to check their operation.
        Use an off-the-shelf unit testing library.
        Turn bugs into test cases.
        Use a symbolic debugger.

Optimize software only after it works correctly.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

::

        Use a profiler to identify bottlenecks.
        Write code in the highest-level language possible.

Document design and purpose, not mechanics.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

::

        Document interfaces and reasons, not implementations.
        Refactor code in preference to explaining how it works.
        Embed the documentation for a piece of software 
        in that software.

Collaborate.
~~~~~~~~~~~~

::

        Use pre-merge code reviews.
        Use pair programming when bringing someone new up to speed 
        and when tackling particularly tricky problems.
        Use an issue tracking tool.

