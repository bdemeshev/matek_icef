# makefile: tex -> pdf
file_name = matmor_exams

$(file_name).pdf: $(file_name).tex chapters/*.tex
	# protection against biber error
	# http://tex.stackexchange.com/questions/140814/
	rm -rf `biber --cache`

	# create pdf
	# will automatically run pdflatex/biber if necessary
	latexmk -xelatex $(file_name).tex

	# clean auxillary files
	latexmk -c $(file_name).tex

clean:
	-rm $(file_name).pdf
	-rm $(file_name).log $(file_name).aux $(file_name).fdb_latexmk $(file_name).fls $(file_name).synctex.gz $(file_name).toc $(file_name).xdv
