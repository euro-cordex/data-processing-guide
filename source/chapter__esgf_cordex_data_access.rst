**ESGF - How to get climate data, what is available & data formats**
====================================================================

-  Earth System Grid Federation Data Portal ESGF

Mission
-------

-  The Earth System Grid Federation (ESGF) is an international
   collaboration for the software that powers most global climate change
   research, notably assessments by the Intergovernmental Panel on
   Climate Change (IPCC).

-  ESGF manages the first-ever decentralized database for handling
   climate science data, with multiple petabytes of data at dozens of
   federated sites worldwide. It is recognized as the leading
   infrastructure for the management and access of large distributed
   data volumes for climate change research. It supports the Coupled
   Model Intercomparison Project (CMIP), whose protocols enable the
   periodic assessments carried out by the IPCC.

-  Using a system of geographically distributed peer nodes —
   independently administered yet united by common protocols and
   interfaces — the ESGF community holds the premier collection of
   simulations and observational and reanalysis data for climate change
   research.

How to get access on CORDEX-Data
--------------------------------

DKRZ Portal: https://esgf-data.dkrz.de/projects/esgf-dkrz/

How to get access on climate data
---------------------------------

Climate data on EDDY
~~~~~~~~~~~~~~~~~~~~

-  Observational data: /eddy/pool/obs, e.g. CRU, TRMM

-  Simulation data: /eddy/pool/sims, e.g. CORDEX, CMIP5

-  Reanalysis data: /eddy/pool/reana, e.g. ERAINT, NECP

ATTENTION: Check the data before you use it carefully!

CORDEX-Data download
~~~~~~~~~~~~~~~~~~~~

-  Change to the directory with the download bash-script
   wget-20160314165933.sh

-  Make the script executable with chmod +x wget-20160314165933.sh

-  Start the data download script with ./wget-20160314165933.sh and
   follow the instructions.

Trouble downloading from esgf with wget script:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  If you want to download more then 1000 files

   http://esgf-data.dkrz.de/esg-search/wget/?project=CMIP5&model=CCSM4&experiment=rcp85&cmor\_table=6hrLev&variable=va&limit=2000

maximum limit would be 10000 now it is limit=2000

-  wget script does not work:

Try insecure-option (-i)

::

    bash wget-##############.sh -i

In this case the server certificat will not be checkt. Or you can
download replicate or from an other server (both has to be chose in the
esgf bevor makeing the wget script.)
