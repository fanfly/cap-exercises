TEXFILES = $(wildcard *.tex)
OBJS = $(TEXFILES:%.tex=%.png)
BUILDDIR = .build

.PHONY: all clean
all: $(OBJS)

%.png: %.pdf
	gm convert -density 600 $< $@

%.pdf: %.tex common.sty
	latexmk -pdf -pdflatex='xelatex -halt-on-error' -outdir=$(BUILDDIR) $<
	cp $(BUILDDIR)/$@ $@

clean:
	rm -rf $(BUILDDIR) *.pdf *.png
