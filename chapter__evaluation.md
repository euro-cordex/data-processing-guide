# **Evaluation of RCM output**

In this chapter the steps needed to evaluate regional climate model output are described

## Data for comparison

### Observation data
Observation data can be found on _eddy_ in

    /eddy/pool/obs

 * EOBS
 * CRU
 * GPCP
 * ERA-Interim, ERA-5
 * DWD station observations (single locations & gridded interpolated maps for Germany)
 * REGNIE
 * HYRAS
 * TRY

**Height correction** 
Comparing temperature values of different data products with 
different underlying topography, a temperature height correction needs to be applied. 
This compensates for erroneous deviations through moist adiabatic temperature gradients. 
To correct the resulting temperature difference fields, the difference of the 
two orography fields (in m) is multiplied with 0.0065 K (i.e. correction by 0.65 K 
per 100m height).

**Regridding** 
When comparing different data products being provided at different spatial resolutions, 
their fields need to get remapped to a common grid. It is good scientific practise to
remap to the coarser grid - as otherwise eventually erroneous finer scale detail will 
be provided which is not inherent to the data product but an artefact through the 
interpolation procedure. 

Pay attention to different remapping methods for each variable! Some methods preserve
fluxes which is of importance e.g. for precipitation and wind but can result in 
strong gradients when remapping from a coarse to a higher resolved grid 
(conservative remapping), while other methods don't (see also RemappingMethods in the REMO-wiki).  

Remember to apply a height correction for temperature fields!
