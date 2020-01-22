Advanced
========

I created a kind of tool template in
`bash <https://git.gerics.de/DataProcessing/BashToolTemplate>`__ and
`python <https://git.gerics.de/DataProcessing/PyToolTemplate>`__ that
demonstrate a number of concepts I presented. You will quickly recognize
that a lot of concepts a much easier to implement using python.

Code Style
----------

You can find some excellent tipps for how to style your python code and
make it more readable on the web, if you google for *pythonic* ways of
programming. You will find, e.g.,

-  https://docs.python-guide.org/writing/style (very detailled)
-  https://medium.com/the-andela-way/idiomatic-python-coding-the-smart-way-cc560fa5f1d6
   (more hands on...)

I can really recommend to read those since some concepts are not
obvious, even if you have some python experience, but will increase
readibilty of your code greatly!

Quick tipps for python
----------------------

From my experience with scripts that I have seen and written myself, I
also would like to list some quick tipps and style recommendations that
I encountered.

Check `PyRemo <https://git.gerics.de/PyREMO/PyREMO>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Use PyRemo for some functionalties and try to use them. If you have some
general tasks that might be reused for other tools later, you should
think about implementing that into PyRemo or make up a new python
package.

Use absolute pathes instead of relative pathes when working with data.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The script should usually be independent of where you execute it.

Do not concatenate pathes and files by adding strings togehter. Use ``os.path.join()``.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Bad

.. code:: python

    dir1 = 'work'
    dir2 = 'data'
    path = dir1 + '/' + dir2 + '/'
    file = 'my_file.nc'
    filename = path + file
    print(filename)

::

    work/data/my_file.nc

Good

.. code:: python

    import os
    dir1 = 'work'
    dir2 = 'data'
    path = os.path.join(dir1,dir2)
    file = 'my_file.nc'
    filename = os.path.join(path,file)
    print(filename)

::

    work/data/my_file.nc

Use `list comprehensions <https://www.google.com/search?client=ubuntu&channel=fs&q=python+list+comprehension&ie=utf-8&oe=utf-8>`__
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If you want to, e.g., filter a list, instead of using:

.. code:: python

    # Filter elements greater than 4
    a = [3, 4, 5]
    b = []
    for i in a:
        if i > 4:
            b.append(i)
    print(a)
    print(b)

::

    [3, 4, 5]
    [5]

you can do it more readable in one line:

.. code:: python

    # Filter elements greater than 4
    a = [3, 4, 5]
    b = [i for i in a if i > 4]
    print(a)
    print(b)

::

    [3, 4, 5]
    [5]

Don't create long ``if`` statements
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Bad

.. code:: python

    a = '3hr'
    if a=='3hr' or a=='6hr':
        print(a)

::

    3hr

Good

.. code:: python

    valid = ['3hr','6hr']
    a = '3hr'
    if a in valid:
        print(a)

::

    3hr

Dont' create complicated ``if`` statements
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Instead of using complicated ``if`` statements:

.. code:: python

    yy = 1980
    mm = 1
    dd = 1
    hh = 1
    ss = 0

    freq = '6h'
    inst = False

    # slice_start
    if freq == '3h':
        if not inst:
            ss = 30 # = se
        else:
            hh = 0
    elif freq == '6h':
        if not inst:
            hh = 3
        else:
            hh = 0

    if freq == '3h' and not inst:
        slice_start = str(yy) + '%02d%02d%02d%02d' % (mm,dd,hh,ss)
    else:
        slice_start = str(yy) + '%02d%02d%02d' % (mm,dd,hh)

    print(slice_start)

::

    1980010103

...you can think about defining your cases first. You can then define
theses cases using *keywords*, e.g.,

.. code:: python

    # define subdaily date conventions depending on the time:cell_method                                                                    
    #             yy  mm  dd  hhss   (year:month:day:hour:minutes)                                                                           
    _6hr_point = '%04d%02d%02d00'                                                                                                            
    _6hr_mean  = '%04d%02d%02d03'       # file date is mid of mean interval                                                                      
    _3hr_point = '%04d%02d%02d00'                                                                                                            
    _3hr_mean  = '%04d%02d%02d0130'     # file date is mid of mean interval                                                                      

    # define dictionary with filename date conventions                                                                                      
    conventions = {}                                                                                                                   
    conventions['inst'] = {'6hr':_6hr_point,'3hr':_3hr_point}                                                                           
    conventions['mean'] = {'6hr':_6hr_mean, '3hr':_3hr_mean}

    # now use it
    cell_method = 'mean'
    freq        = '6hr'
    date        = (1980,1,1)

    slice_start = conventions[cell_method][freq] % date

    print(slice_start)

::

    1980010103

You see, how this makes the code much easier to read and understand?
Even better, you can now configure this code using clear *keyowrds* that
you can also use during configuration, etc...
