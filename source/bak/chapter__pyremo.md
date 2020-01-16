# **PyRemo**

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

### DataHandler

Check if files exist in the tape archive:
```python
from PyRemo.FileConventions import REMO_2015_TAPE_ARCHIVE, REMO_2015_DISK_ARCHIVE
from PyRemo.DataHandler import DataHandler

# define experiment id for file conventions
expid = '061074'

# path to hpss tape archive 
tape_path = '/hpss/arch/ch0636/CORDEX/CORE-ATLAS/remo/exp061074'
# path to disk archive
disk_path = '/work/ch0636/g300046/remo_results_061074'

# create a DataHandler
dh = DataHandler()

#
# check files on tape archive
#
# check all files depending on naming convention
dh.check_archive_files(expid, tape_path, years=[2006], conv=REMO_2015_TAPE_ARCHIVE())
# check only a-files
dh.check_archive_files(expid, tape_path, years=[2006], conv=REMO_2015_TAPE_ARCHIVE(), types=['afiles'])
# check only e-files for one month
dh.check_archive_files(expid, tape_path, years=[2006], months=[1], conv=REMO_2015_TAPE_ARCHIVE(), types=['afiles'])
# check only p-files for the whole range
dh.check_archive_files(expid, tape_path, years=range(2006,2100), conv=REMO_2015_TAPE_ARCHIVE(), types=['pfiles'])
#
#
# check files on disk archive
#
# check only p-files 
dh.check_archive_files(expid, disk_path, years=range(2006,2100), conv=REMO_2015_DISK_ARCHIVE(), types=['mfiles'])
# check all for one year and print a warning if a file does not exist
check_list = dh.check_archive_files(expid, disk_path, years=[2006], conv=REMO_2015_DISK_ARCHIVE())
for check in check_list:
  if not check[1]: print('Warning, could not find file: '+check[0])
```

Download archived REMO output:
```python
import os
import logging

from PyRemo.FileConventions import REMO_2015, REMO_2015_TAPE_ARCHIVE, REMO_2015_DISK_ARCHIVE
from PyRemo.DataHandler import DataHandler
from PyRemo.Scheduler import Scheduler


logging.basicConfig(level=logging.DEBUG)

# define some defaults for the job header
SLURM_HEADER = {  'partition'   :'shared',
                  'ntasks'      :'1',
                  'mem_per_cpu' :'1280',
                  'mail_type'   :'FAIL',
                  'account'     :'ch0636',
                  'time'        :'08:00:00'}


expid = '061074'

# define naming and archiving conentions
tape_archive = REMO_2015_TAPE_ARCHIVE()
disk_archive = REMO_2015_DISK_ARCHIVE()

# path to data on the disk
disk_path = '/work/ch0636/g300046/remo_results_061074'
dest_path = disk_path
# path to data on the hpss tape archive
tape_path = '/hpss/arch/ch0636/CORDEX/CORE-ATLAS/remo/exp061074'


# create a DataHandler for parallel processing
dh = DataHandler(parallel=True,sys='SLURM',header_dict=SLURM_HEADER)

# submit jobs to retrieve data from the archive
dh.retrieve_archive_from_tape(expid, tape_path, years=range(2006,2100), types=['efiles','pfiles'], \
                              conv=tape_archive, destdir=dest_path)

# create a new scheduler to get job information
my_scheduler = Scheduler(sys='SLURM',logfile='DataHandler_061074_extract.jobids.ini')
my_scheduler.log_jobs_acct() 
```
