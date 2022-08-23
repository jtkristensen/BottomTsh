
### usage:
### "make song=./path/to/song.agda"

.SILENT:songbook setup clean
.PHONEY:default songbook setup clean

flags=--compile
c=agda $(flags)

default:
	 $(c) $(song)

songbook: clean setup
	for f in $$(ls ./Songbook) ; do $(MAKE) song=./Songbook/$$f ; done

play:
	$(MAKE) song=./Songbook/$(song).agda ; $(song)

setup: # Check if prerequisites are installed.
	if ! which ghc > /dev/null; then                            \
	   echo "It would seem that you have not installed ghc"   ; \
	   exit 0                                                 ; \
	fi                                                        ; \
	if ! which cabal > /dev/null; then                          \
	   echo "It would seem that you have not installed cabal" ; \
	   exit 0                                                 ; \
	fi                                                        ; \
	cabal install Agda csound-expression csound-sampler

clean:
	for f in $$(cat .gitignore) ; do rm -rf $$f ; done
