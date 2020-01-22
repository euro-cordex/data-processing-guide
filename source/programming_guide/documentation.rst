Documentation
=============

A good documentation of your work is essential to ensure good quality
and prevent misuse and wrong results. Detailled documentation, although
it may take some time to write, can save a lot of time since your code
can be applied by others and ensures that it is applicable independently
of yourself. A proper documentation will guide others to use your code
and save yourself time by not having to explain it to new users again
and again. It will also help you making up your mind about new upcoming
work by redirecting the task that your code fullfils to others.
Explaining how your code works will also enable others to contribute and
improve your work. And last but not least, it will enable yourself to
remember what you have done if you have to return to your code after
months of doing something else.

You should also keep in mind, that documenting properly is part of the
`rules of good scientific
practice <https://www.helmholtz-berlin.de/zentrum/strategie/regeln-guter-wissenschaftlicher-praxis_en.html>`__
of the Helmholtz Association, e.g.,

*(4) Good scientific practice includes the documentation of all steps,
securing all electronic records and data, ensuring reproducibility
before publication, and allowing authorized third parties access to the
records.*

``README``
----------

Minimal requirements of a good documentation should contain at least a
``README`` file that resides in your code's root directory. You might
even consider starting your project by writing the ``README`` file first
(http://tom.preston-werner.com/2010/08/23/readme-driven-development.html).
There is tons of guides how to properly document, e.g., I found a good
article that says
(https://www.writethedocs.org/guide/writing/beginners-guide-to-docs/)

::

        If people don’t know why your project exists,
        they won’t use it.
        If people can’t figure out how to install your code,
        they won’t use it.
        If people can’t figure out how to use your code,
        they won’t use it.

There is lots of truth in these words that guides us to what the
documentation must contain. It is not only true for open source code but
also for interal codes that should be used by other colleagues without
great explanation and also if you leave the company. Consequently, the
``README`` file should contain at least sections describing

-  installation instructions (requirements)

-  configuration instructions

-  operating instructions (how to use)

-  operating examples

-  where to find input data / what formats are required

-  how to contribute

-  known bugs

-  troubleshooting

-  contact information

-  link to user's guide

-  copyright and licensing information

Of course, this is a rather generic list. The details depend strongly on
whether some additional user's guide document is available that explains
your work more rigourously. The get some inspiration it is also nice to
simply look at good examples
(https://github.com/matiassingers/awesome-readme). You should also
consider using the markup language that will allow you to format your
``README`` nicely for, e.g., gitlab and github.

User's Guide
------------

A more detailled documentation of your work is highly desirable and it
might be a good idea to setup an extra document to explaind your code in
more detail, giving a theoretical background on the implementation and
enable others to not only *use* but also to *understand* the
functionalities of your code. A good user's guide should also contain a
tutorial, e.g., a detailled step by step instruction on a working
example that can be used as a starting point for the user's own
application.

Bad practices frequently encountered
------------------------------------

-  Not documentating at all! Instead, usually a useless link to some
   meaningless website is provided.
-  Documenting with Python Notebooks. Python notebooks are good for
   exploring data and tools for designing a program, they are NOT suited
   for production and they certainly DO NOT count as documentation.
-  Only Bullet points. Lots of documentation I have seen consists of
   simple instructions in the form of bullet point. Bullet points are
   good for overviews, etc... Do not only explain WHAT to do but als
   WHY! You user is probably smart enough to read a whole sentence in
   text form.
-  Commiting everything. Just putting every single script to the version
   control repository does NOT count as documentation.
