.PHONY: build all clean

all: build

build: lib/proposal.tex

	# setup
	cp ./packages/apa6.cls ./apa6.cls

	# compile
	latexmk --pdf --pdflatex="pdflatex" --use-make lib/index.tex --silent
	mv ./index.pdf ./build/index.pdf

	# clean
	rm index*
	mkdir -p build
	rm ./apa6.cls

clean:
	rm -f apa6.cls
	latexmk -CA