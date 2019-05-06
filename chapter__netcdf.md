# Netcdf:
*Arne Kriegsmann and Torsten Weber*

**What is NetCDF?**

NetCDF is a set of software libraries and self-describing, machine-independent data formats that support the creation, access, and sharing of array-oriented scientific data. NetCDF was developed and is maintained at Unidata. Unidata provides data and software tools for use in geoscience education and research. 

The NetCDF homepage may be found at http://www.unidata.ucar.edu/software/netcdf/. The NetCDF source-code is hosted at GitHub, and may be found directly at http://github.com/Unidata/netcdf-c.                          (source: http://www.unidata.ucar.edu)

## How can I see the data description and the content of a NetCDF-file?

Most important information of a NetCDF-file is the header, which can be displayed with
     	       ncdump -h file

The header of a NetCDF-file contains information of:
    * dimensions of the variable(s)
    * variables
    * global attributes

##ncview for graphical information of the data##

       	  ncdump --help