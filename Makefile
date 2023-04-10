TEXFILES = $(wildcard *.tex)
OBJS = $(TEXFILES:%.tex=target/%.png)

.PHONY: all clean
all: $(OBJS)

target/%.png: build/%.pdf
	mkdir -p target
	gm convert -density 600 $< $@

build/%.pdf: %.tex common.sty
	mkdir -p build
	latexmk -pdf -pdflatex='xelatex -halt-on-error' -outdir=build $<

clean:
	rm -rf build target
