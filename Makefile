TEXFILES = $(wildcard src/*.tex)
OBJS = $(TEXFILES:src/%.tex=target/%.png)

.PHONY: all clean

all: $(OBJS)

target/%.png: build/%.pdf
	mkdir -p target
	gm convert -density 600 $< $@

build/%.pdf: src/%.tex src/common.sty
	mkdir -p build
	cd src && latexmk -pdf -pdflatex='xelatex -halt-on-error' -outdir=../build $(notdir $<)

clean:
	rm -rf build target
