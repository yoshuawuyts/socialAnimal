.PHONY: build all clean

all: build

build: lib/proposal.tex
	# setup
	rm -rf build/
	cp ./lib/index.tex ./index.tex
	cp ./packages/apa6.cls ./apa6.cls

	# compile
	latexmk --pdf --pdflatex="pdflatex" --use-make index.tex --silent
	mkdir -p build
	mv ./index.pdf ./build/index.pdf

	# clean
	rm -f index*
	rm -f ./apa6.cls
	rm -f *.aux

clean:
	rm -rf build/
	rm -f index*
	rm -f apa6.cls
	rm -f *.aux