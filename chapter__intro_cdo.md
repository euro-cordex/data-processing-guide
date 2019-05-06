# Introduction into the Climate Data Operator (CDO)
*Torsten Weber and Arne Kriegsmann*

## Climate Data Operators (CDO)
**What is CDO?**

CDO is a collection of command line operators to manipulate and analyse climate and numerical weather prediction model data. Supported data formats are GRIB 1/2, netCDF 3/4, SERVICE, EXTRA and IEG. There are more than 600 operators available.

    * CDO is freely available for linux and windows systems.

A detailed documentation with a tutorial and the software can be find at https://code.zmaw.de/projects/cdo/

### Examples:

See version of cdo you are using:
    	    cdo -V

Generate an absolute time axis:
	 cdo -a copy input_file output_file

Output format: grb, grb2, nc, nc2, .....:
       	       cdo -f grb copy input_file output_file

cdo Reference Card contains the most important commands, you find the Reference card https://code.mpimet.mpg.de/projects/cdo/embedded/cdo_refcard.pdf


### Further Example
o change relative time to absolute time and select the year 1950 from a file:
cdo –a selyear,1950 input_file output_file

To select the single years 1950, 1960, 1970 from a file:
cdo selyear,1950,1960,1970 input_file output_file

To select the period from 1950 - 1970 from a file:
cdo selyear,1950/1970 input_file output_file

To select a geographical region from a file:
Operator sellonlatbox,lon_min,lon_max,lat_min,lat_max

South African region: lon. 8 deg. to 42 deg., lat. -38 deg. to -4 deg.
cdo sellonlatbox,8,42,-38,-4 input_file output_file

o change the unit of monthly mean precipitation from [kg m-2 s-1] to [mm day-1],
the following assumption must be made: 1 [kg m-2 s-1] ≈ 1 [litre m-2 s-1] ≈ 1 [mm s-1]:
cdo mulc,86400 pr_mon_file tmp_file (multiplied with seconds per day)
cdo chunit,”kg m-2 s-1”,”mm day-1” tmp_file result_file

To change the unit of monthly mean precipitation from [mm day-1] to [mm month-1], use this:
cdo muldpm pr_mon_file tmp_file (multiplied days per months)
cdo chunit,”mm day-1”,”mm month-1” tmp_file result_file

To calculate yearly sum from monthly precipitation [mm month-1], use this:
cdo yearsum pr_mon_file tmp_file
cdo chunit,”mm month-1”,”mm year-1” tmp_file result_file

Use pipes to combine several operations in one command
Syntax: cdo op3 -op2 -op1 input_file output_file

o calculate a map of a climate change signal, the time mean of the historical data
has to be subtracted from the time mean of the scenario data:
cdo timmean scen_2071-2100_file scen_tmp_file
cdo timmean hist_1971-2000_file hist_tmp_file
cdo sub scen_tmp_file hist_tmp_file result_file

or same result using the pipe function:
cdo sub –timmean scen_2071-2100_file –timmean hist_1971-2000_file
                                                            result_file

Another example using the pipe function:
Calculating the yearly sum from monthly mean precipitation [kg m-2 s-1] to [mm year-1]
cdo chunit,”kg m-2 s-1”,”mm year-1” -yearsum -muldpm -mulc,86400
                                               pr_mon_file results_file
To calculate a yearly time series, the data has to be converted to year mean and field mean:
cdo fldmean –yearmean scen_2010-2100_file result_file

To calculate a climate change signal for a time series, the time mean and field mean
of historical data (-> single value) have to be subtracted from the field mean of the scenario data:
cdo fldmean –timmean hist_1971-2000_file mean_1971-2000_file
cdo sub –fldmean scen_2071-2100_file mean_1971-2000_file result_file

To calculate a yearly time series as 30-years running mean, the data has to be converted to year mean and field mean as well as to running mean:
cdo runmean,30 -fldmean –yearmean scen_2010-2100 result_file

Data masking
o order to cut specific areas such as basins or countries from the data, there is a CDO command called ifthen. This command needs a mask with zeros/ones at the same grid
as the data.

Usage:
cdo ifthen mask_file input_file out_file

mask_file must have the same grid and data format as the input file!

Example:
cdo ifthen south_africa.nc precip.nc south_africa_precip.nc

How to extract point data from model data in a ASCII file?
Calculate the weighted average of each grid point plus the 8 surrounding points
to avoid strange values:
cdo smooth9 input_file tmp1_file
Perform the nearest neighbour remapping of the field to extract a longitude/latitude point:
cdo remapnn,lon=XX/lat=YY tmp1_file tmp2_file
Print a customised table in a ASCII file:
cdo outputtab,name,year,month,day,lon,lat,value tmp2_file >result.txt 

Example: Output for temperature with longitude 10 deg. and latitude 20 deg.:

#    name  year month day    lon    lat    value 
     tas  1980  1 16     10     20  281.863 
     tas  1980  2 15     10     20  285.643 
     tas  1980  3 16     10     20   292.52 
     tas  1980  4 16     10     20  298.133 
     tas  1980  5 16     10     20   300.33 
     tas  1980  6 16     10     20  299.219 
     .....

Data remapping
When comparing two data sets with different spatial resolutions, always remap
the data with the higher grid resolution to the lower one! 

To remap precipitation data, use remapcon (first order conservative remapping)
in order to be sure that no precipitation amount will get lost. 

To remap temperature data, try to use remapbil (bilinear interpolation) to keep the spatial pattern. In some cases, remapbil will not work because of the longitude/latitude description, then use remapcon.

Usage:
cdo remapcon,grid_descr_file inut_file output_file

grid_descr _file can be a NetCDF file or a ASCII file!

To generate a ASCII description file, use griddes:
cdo griddes input_file >grid_descr.txt

Exercise: Spatial distribution of climate change pattern

Calculate a climate change map of mean yearly precipitation over southern Africa from the spatial regional climate projection MPI-ESM-LR/CSC-REMO2009 RCP8.5.
Reference period: 1971-2000
Scenario period: 2071-2100
Southern African region: lon. 8 deg. to 42 deg., lat. -38 deg. to -4 deg.
Change the directory with cd ~/training/course/work

Step 1: 	Calculate the mean yearly precipitation over southern Africa for the historical
	period 1971-2000 and check the outcome with ncview! Change the relative time to 
	absolute time and the unit from [kg m-2 s-1] to [mm year-1]. 
	Use the following CDO commands:  
	sellonlatbox, selyear, mulc,86400, muldpm, chunit, yearsum,
	timmean

Step 2: 	Calculate the mean yearly precipitation for the scenario period 2071-2100 and
	check the outcome with ncview!  (same procedure as in step 1)

Step 3: 	Subtract the historical from the scenario period and check the outcome with ncview! 
              Use the results from step 1 and 2 and the CDO command sub 

