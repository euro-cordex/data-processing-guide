#
# makefile for remo latex user guide
#

NAME = data_processing_guide
TEX = lualatex

CONTENT = data_processing_guide.tex introduction.tex remo_output.tex 

#makes only the dvi file
${NAME}.pdf: ${NAME}.tex ${CONTENT}
	${TEX} ${NAME}.tex
	bibtex ${NAME}.aux
	@echo '**********************************'
	@echo '!!!!!!!!!bibtex done!!!!!!!!!!!!'
	@echo '**********************************'
	${TEX} ${NAME}.tex
	${TEX} ${NAME}.tex
	@echo '**********************************'
	@echo '!!!!!!!!!dvi done!!!!!!!!!!!!'
	@echo '**********************************'

html :  ${CONTENT}
	htlatex ${NAME}.tex "MyFonts.cfg,  NoFonts, charset=utf-8" " -utf8 -cunihtf" "" -shell-escape
#	htlatex ${NAME}.tex "ht5mjlatex.cfg,  NoFonts, charset=utf-8" " -utf8 -cunihtf" "" -shell-escape

clean:  
	rm *.aux *.log *.dvi *.pdf *.blg *.toc *.out *.spl *.bbl \
        *.html remo_doc*.png *.xref *.idv *.css *.lg *.4ct *.4tc  \
        *.tmp remo_ug*.png remo_ug*.svg remo_ug*.jpg html.
