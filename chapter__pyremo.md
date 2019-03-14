# PyRemo

The heart of PyRemo are the data handling and plotting modules. The OoPlot package 
contains everything that is needed to do high quality plots based on PyNGL. 
Some useful stand-alone functions for plotting purposes can be found in Plotting. 
ConvertToGFile contains functions that are used to convert global model data into 
the g-file format readable for the REMO pre-processor. 
CalcInput provides functions for calculating input with the pre-processor for the REMO model. 
The Ftp module provides functions to up- and download data to and from the tape archive at dkrz. 
IO contains a basic class to read and write Fortran style binary data. The module ShellTools is a 
collection of useful functions that are run on a Linux shell, e.g., to create or 
remove directories.

Documentation of API: http://136.172.63.17/REMO/PyRemo/PyRemo/docs/build/html/

## Examples

Download archived REMO output
```python
from PyRemo.FileConventions import REMO_2015_TAPE_ARCHIVE
from PyRemo.DataHandler import DataHandler

# define an archive and DataHandler
tape_archive = REMO_2015_TAPE_ARCHIVE()
dh = DataHandler()

# call the retrieve function
dh.retrieve_archive_from_tape('061074',tape_path,years=[2006,2007],types=['afiles'],conv=tape_archive, destdir='/scratch/g/g300046')
```