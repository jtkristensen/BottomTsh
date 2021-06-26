all: figures
	$(MAKE) clean
	pdflatex --shell-escape main.tex
	pdflatex --shell-escape main.tex

figures:
	cd ../figures/ly && $(MAKE) all

clean:
	rm -f *.eps *.aux *.log *.out *.snm *.nav *.toc *.vrb
	rm -f main.pdf
	rm -rf _minted-main
