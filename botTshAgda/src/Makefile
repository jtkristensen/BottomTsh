

i=*.agdai
flags=--compile
c=agda $(flags)

default : clean_examples Examples
compile : clean_all default
clean   : clean_all

Examples:
	$(c) ./Examples.agda
	./Examples

clean_all: clean_alonzo clean_intermediate clean_examples

clean_alonzo:
	rm -rf ./MAlonzo

clean_examples:
	rm -f ./Examples
	rm -f ./tmp.csd
	rm -f ./*.o
	rm -f ./*.hi

clean_intermediate:
	rm -f ./$(i)
	rm -f ./*/$(i)
	rm -f ./*/*/$(i)
	rm -f ./*/*/*/$(i)
