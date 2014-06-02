.PHONY: build all clean

all: build

build: lib/proposal.tex
	cp ./packages/apa6.cls ./apa6.cls
	latexmk --pdf --pdflatex="pdflatex --aux-directory=/build" --use-make lib/index.tex --silent
	latexmk -c --silent
	mkdir -p build
	mv ./index.pdf ./build/index.pdf
	rm ./apa6.cls

clean:
	latexmk -CA