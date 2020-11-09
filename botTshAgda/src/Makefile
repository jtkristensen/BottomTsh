
### usage:
### "make song=./path/to/song.agda"

i=*.agdai
flags=--compile
c=agda $(flags)

default:
	 $(c) $(song)

songbook: clean_intermediate
	for f in $$(ls ./Songbook) ; do $(MAKE) song=./Songbook/$$f ; done

clean   : clean_all

clean_all: clean_alonzo clean_intermediate clean_examples

clean_alonzo:
	rm -rf ./MAlonzo

clean_intermediate:
	rm -f ./$(i)
	rm -f ./*/$(i)
	rm -f ./*/*/$(i)
	rm -f ./*/*/*/$(i)
	rm -f ./tmp.csd
	rm -f ./*.o
	rm -f ./*.hi
	rm -f ./Figure*
	rm -f ./BrazillianSixteen
	rm -f ./Shuffle
	rm -f ./Rock1
	rm -f ./MobDemo
	rm -f ./Phrasing
	rm -f ./HitTheRoadDemo
	rm -f ./Jeppe
	rm -f ./Demo
	rm -f ./HeyBaby
	rm -f ./Dilla
	rm -f ./Gnava
	rm -f ./DeanTown
	rm -f ./World
