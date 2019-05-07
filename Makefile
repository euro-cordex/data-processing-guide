#
# Makefile for remo user guide
#

TARGET = data_processing_guide

SOURCES = chapter__introduction_to_climate_modelling.md\
chapter__netcdf.md\
chapter__usefull_shell_commands.md\
chapter__esgf_cordex_data_access.md\
chapter__intro_cdo.md\
chapter__visualisation.md\
chapter__pyremo.md\
chapter__remo_output.md\
chapter__interpolating_stations.md \
chapter__git.md\
chapter__troubleshooting.md


usage:
	echo "make pdf html clean"

pdf: README.md ${SOURCES}
	pandoc README.md ${SOURCES} -o ${TARGET}.pdf --latex-engine=xelatex

html : ${SOURCES}
#	pandoc README.md ${SOURCES} -o ${TARGET}.html
#	pandoc README.md ${SOURCES} -o index.html -f markdown --template standalone.html --toc --toc-depth=2 
	pandoc README.md ${SOURCES} --template toc-sidebar.html --toc -B nav -o index.html 

clean:  
	rm -f ${TARGET}.pdf ${TARGET}.html
