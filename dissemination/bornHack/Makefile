all: figures
	$(MAKE) clean
	pdflatex --shell-escape main.tex
	pdflatex --shell-escape main.tex

figures:
	cd ../figures/ly && $(MAKE) all

clean:
	for f in $$(cat .gitignore) ; do rm -rf $$f ; done
