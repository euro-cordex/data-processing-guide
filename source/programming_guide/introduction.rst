.. role:: raw-latex(raw)
   :format: latex
..

Introduction
============

I decided to start writing this guide not only for others but also for
myself to wrap up some experiences during my work in the scientic
software development process. I think one of the most interesting terms
I found when I read about the software development process is the
*reusabilty*. So let me quote Wikipedia here:

**Reusability implies some explicit management of build, packaging,
distribution, installation, configuration, deployment, maintenance and
upgrade issues. If these issues are not considered, software may appear
to be reusable from design point of view, but will not be reused in
practice.**

I think the most important issues are often with scientists writing
software that was not originally intended to be shared with others but
only for their personal use. Typically, a scientist has to tackle a task
and starts writing a script. At first, this script will simply be a
collection of commands that are required, e.g., to process some input
data and produce output data. This script will be fixed and debugged
until it works fine for the scientist. In fact, most scientists are
typically satisfied with their scripts as long as they produce the
expected *results*. The output is the most important quality criteria
for their work and most often, this is how their work is evaluated. And
we can not blame the scientist for this because timelines in projects
are often strict and mostly do not allow for proper code evaluation or
documentation.

But what also happens frequently is that the scientist has to do the
same task again with some other input data set. Because the scientist
produced good results earlier, he returns to the first draft of his old
script and decides, of course, to reuse it. This might be possible by
simply changing the input data set in the header of the script, but
probably, the new data set is somehow different in its format. The
scientist might also have to enhance his script to produce some more
results that the original data set could not provide. However, good
scientific practice requires that the scientist also can reproduce the
results from the original input data and decides not to take any risks.
Consequently, the scientist will *copy* the original script to a new
file, typically with some underscore followed by a comment to describe
the difference to the old script. We have all seen these awful
underscores followed by meaningless comments like ``_new``,
``_new_project_``, ``_USE_THIS!``, ``_DO_NOT_USE_THIS`` etc... The
scientist will then adapt his new script to tackle the format of the new
input data and also add new functionalities that the new data opens up.
But soon enough, this will end in a variety of different script versions
(or *branches*) that essentially share the same core of code but are
almost impossible to maintain since a *reintegration* usually does not
take place.

At this point, a very important step is usually missing:
**abstraction**. This means, that the author of the script should
revisit his work and extract the core functionalities by identifying
patterns in the code, creating abstract subroutines and functions that
will handle basic work independently (e.g. from the input data set),
remove hard coded information as much as possible by moving it into
external configuration files, and create types or classes from data
structures to handle namespaces. This all sounds a little theoretical
but I will try to give examples. This will require some work but will
end in a tool that can be configured and maintained much easier and, if
properly documented, can be used by a wider community.

Yes, I know, you will say, I dont' have time for this, I need to get my
stuff running today because I have to deliver data tomorrow. But it is
truism that in the end, a well designed script will save you tons of
time later, especially if you can distribute work to others. I also very
strongly believe that a well designed and documented tool should be fun
to use, seriously! This means that other should like to use it and not
be afraid if they have to use it for a certain taks...

Last, but not least, here is a nice short article, that summarizes the
problem quite nicely:

https://www.software.ac.uk/blog/2016-09-26-scientific-coding-and-software-engineering-whats-difference



