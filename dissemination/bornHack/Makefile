# Requirements
# - you need a variety of things from texlive
# - lytex
# - Pygments (pip install)

all: figures
	$(MAKE) clean
	pdflatex --shell-escape main.tex
	pdflatex --shell-escape main.tex

figures:
	cd ../figures/ly && $(MAKE) all

clean:
	for f in $$(cat .gitignore) ; do rm -rf $$f ; done
