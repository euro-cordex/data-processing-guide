**CMIP5 model output**
======================

If you want to use CMIP5 data have a look if this is useful:

::

    https://git.gerics.de/data-processing/pyspatem/tree/master/PySpaTeM

Trouble shooting
----------------

A problem occured while working with CMIP5 data. Not every GCM has
delivered a Land-Sea-Mask to the ESGF.

Now it is not possible to maskout the land points for some GCMs.

Solution:
~~~~~~~~~

If we do not have a lsm, we will use the landseemask of CRU and remap it
to the GCM-grid
