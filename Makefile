
FILEBASE="pascha"
PATH := /Library/TeX/texbin/:/Applications/LilyPond.app/Contents/Resources/bin/:$(PATH)
SHELL := env PATH=$(PATH) /bin/bash
WORKDIR=$(dir $(realpath $(firstword $(MAKEFILE_LIST))))
OUTDIR=$(WORKDIR)/output
LATEX=xelatex


all: choir

choir:

	lilypond-book --pdf --format=latex --output "$(WORKDIR)/LilyPondTemp" $(FILEBASE).lytex ;
	cd "$(WORKDIR)/LilyPondTemp"; \
	cp "$(WORKDIR)/styles/liturgy.sty" ./; \
	$(LATEX) $(FILEBASE).tex ;
	cp "$(WORKDIR)/LilyPondTemp/$(FILEBASE).pdf" "$(OUTDIR)";

clean:
	rm -rf "$(WORKDIR)/LilyPondTemp"
