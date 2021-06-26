# usage:
# make all     -- makes all figures
# make clean   -- removes all figures
# make current -- recompiles the figure I am currently working on.

# - List of figures.
dseq=dseq-basic.pdf dseq-tuplets.pdf
notes=note-ganz.pdf more-notes.pdf tuplets-example1.pdf tempo-example1.pdf tempo-example2.pdf
transformations=two8ths.pdf swing101.pdf shuffle101.pdf 5shuffle.pdf
grooves=rock2.pdf rock2_shuffle3.pdf rock2_hh_shuffle.pdf spacerock2.pdf rock2times3.pdf
patterns=programming_drumpatterns1.pdf programming_drumpatterns2.pdf programming_drumpatterns3.pdf

all: $(dseq) $(notes) $(transformations) $(grooves) $(patterns)

programming_drumpatterns1.pdf:
	./figure $(out) $(list) programming_drumpatterns1

programming_drumpatterns2.pdf:
	./figure $(out) $(list) programming_drumpatterns2

programming_drumpatterns3.pdf:
	./figure $(out) $(list) programming_drumpatterns3

dseq-basic.pdf:
	./figure $(out) $(list) dseq-basic

note-ganz.pdf:
	./figure $(out) $(list) note-ganz

more-notes.pdf:
	./figure $(out) $(list) more-notes

tuplets-example1.pdf:
	./figure $(out) $(list) tuplets-example1

tempo-example1.pdf:
	./figure $(out) $(list) tempo-example1

tempo-example2.pdf:
	./figure $(out) $(list) tempo-example2

dseq-tuplets.pdf:
	./figure $(out) $(list) dseq-tuplets

two8ths.pdf:
	./figure $(out) $(list) two8ths

swing101.pdf:
	./figure $(out) $(list) swing101

shuffle101.pdf:
	./figure $(out) $(list) shuffle101

5shuffle.pdf:
	./figure $(out) $(list) 5shuffle

rock2.pdf:
	./figure $(out) $(list) rock2

rock2_shuffle3.pdf:
	./figure $(out) $(list) rock2_shuffle3

rock2_hh_shuffle.pdf:
	./figure $(out) $(list) rock2_hh_shuffle

spacerock2.pdf:
	./figure $(out) $(list) spacerock2

rock2times3.pdf:
	./figure $(out) $(list) rock2times3

clean:
	for f in $$(cat .gitignore) ; do rm -rf $$f ; done

current:
	rm -f $(cur)
	$(MAKE) $(cur)
