
### usage:
### "make song=./path/to/song.agda"

flags=--compile
c=agda $(flags)

default:
	 $(c) $(song)

songbook: clean setup
	for f in $$(ls ./Songbook) ; do $(MAKE) song=./Songbook/$$f ; done

play:
	$(MAKE) song=./Songbook/$(song).agda ; $(song)

setup:
	cabal install Agda csound-expression csound-sampler

clean:
	for f in $$(cat .gitignore) ; do rm -rf $$f ; done
