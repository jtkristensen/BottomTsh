# usage:
# make all    -- makes all figures.
# make clean  -- removes all figures.
# make *.pdf  -- makes a particular pdf.

# - List of figures.
dseq=dseq-basic.pdf dseq-tuplets.pdf
notes=note-ganz.pdf more-notes.pdf tuplets-example1.pdf tempo-example1.pdf tempo-example2.pdf
transformations=two8ths.pdf swing101.pdf shuffle101.pdf 5shuffle.pdf
grooves=rock2.pdf rock2_shuffle3.pdf rock2_hh_shuffle.pdf spacerock2.pdf rock2times3.pdf
patterns=programming_drumpatterns1.pdf programming_drumpatterns2.pdf programming_drumpatterns3.pdf

# - Output directory
out=out-dir

all: $(dseq) $(notes) $(transformations) $(grooves) $(patterns)

%.pdf : $(out)
	FILE=$@                                            && \
	FILE="$${FILE%%.*}"                                && \
	lilypond-book --output=$(out) --pdf ./$$FILE.lytex && \
	cd ./$(out)                                        && \
	pdflatex $$FILE.tex                                && \
	pdfcrop  $$FILE.pdf                                && \
	mv ./$$FILE-crop.pdf ./../$$FILE.pdf

$(out) :
	mkdir $(out)

clean:
	for f in $$(cat .gitignore) ; do rm -rf $$f ; done
