#
# Makefile for remo user guide
#

TARGET = data_processing_guide

SOURCES = chapter__remo_output.md \
chapter__interpolating_stations.md \
chapter__trouble_shooting_for_pyplot_tools.md

usage:
	echo "make pdf html clean"

pdf: README.md ${SOURCES}
	pandoc README.md ${SOURCES} -o ${TARGET}.pdf

html : ${SOURCES}
	pandoc README.md ${SOURCES} -o ${TARGET}.html

clean:  
	rm -f ${TARGET}.pdf ${TARGET}.html
