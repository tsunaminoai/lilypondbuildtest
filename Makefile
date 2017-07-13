
FILEBASE="pascha"
PATH := /Library/TeX/texbin/:/Applications/LilyPond.app/Contents/Resources/bin/:$(PATH)
SHELL := env PATH=$(PATH) /bin/bash
WORKDIR=$(dir $(realpath $(firstword $(MAKEFILE_LIST))))
OUTDIR=$(WORKDIR)/output
LATEX=xelatex
TEMPDIR="$(WORKDIR)/LilyPondTemp"

all: choir

choir:

	@echo "Building with LilyPond in $(WORKDIR)";
	lilypond-book --pdf --format=latex --output "$(TEMPDIR)" "$(FILEBASE).lytex" ;
	ls -R
	@echo "Moving to temp environment";
	mkdir -p "$(TEMPDIR)/styles/";
	cp "$(WORKDIR)/styles/liturgy.sty" "$(TEMPDIR)/styles/";

	@echo "Running LaTeX on LilyPond output";
	#dont remove this non-linebreak
	cd "$(TEMPDIR)";\
	$(LATEX) "$(FILEBASE).tex" ;
	mkdir -p "$(OUTDIR)";
	cp "$(TEMPDIR)/$(FILEBASE).pdf" "$(OUTDIR)";
	@echo "Build complete. Final PDF located at $(OUTDIR)/$(FILEBASE).pdf";

clean:
	rm -rf "$(WORKDIR)/LilyPondTemp"
