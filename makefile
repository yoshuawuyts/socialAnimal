.PHONY: build all clean

all: build

build: lib/proposal.tex
	# setup
	rm -rf build/
	cp ./lib/index.tex ./index.tex
	cp ./packages/apa6.cls ./apa6.cls
	cp ./packages/apacite.sty ./apacite.sty
	cp ./packages/apacite.bst ./apacite.bst

	# compile
	latexmk --pdf --pdflatex="pdflatex" --use-make index.tex
	
	mkdir -p build
	mv ./index.pdf ./build/index.pdf

	# clean
	rm -f index*
	rm -f ./apa6.cls
	rm -f ./apacite.sty
	rm -f ./apacite.bst
	rm -f ./biblatex.sty
	rm -f ./biblatex2.sty
	rm -f *.aux

clean:
	rm -f index*
	rm -f apa6.cls
	rm -f ./apacite.sty
	rm -f ./apacite.bst
	rm -f ./biblatex.sty
	rm -f ./biblatex2.sty
	rm -f *.aux
	rm -rf build/