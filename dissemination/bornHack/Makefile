all:
	$(MAKE) clean
	pdflatex --shell-escape main.tex
	pdflatex --shell-escape main.tex

clean:
	rm -f *.eps *.aux *.log *.out *.snm *.nav *.toc *.vrb
	rm -f main.pdf
	rm -rf _minted_main
