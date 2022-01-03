# makefile: tex -> pdf
file_name = matmor_exams

$(file_name).pdf: $(file_name).tex chapters/*.tex
	# protection against biber error
	# http://tex.stackexchange.com/questions/140814/
	rm -rf `biber --cache`

	# create pdf
	# will automatically run pdflatex/biber if necessary
	# latexmk -xelatex $(file_name).tex
	arara -v $(file_name).tex

	# clean auxillary files
	# latexmk -c $(file_name).tex

clean:
	-rm $(file_name).pdf
	-rm $(file_name).log 
	-rm $(file_name).aux 
	-rm $(file_name).fdb_latexmk 
	-rm $(file_name).fls 
	-rm $(file_name).synctex.gz 
	-rm $(file_name).toc 
	-rm $(file_name).xdv
	-rm $(file_name).bbl
	-rm $(file_name).blg
	-rm $(file_name).out
	-rm $(file_name).run.xml
	
