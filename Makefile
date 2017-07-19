
FILEBASE="pascha"
PATH := /Library/TeX/texbin/:/Applications/LilyPond.app/Contents/Resources/bin/:$(PATH)
SHELL := env PATH=$(PATH) /bin/bash
WORKDIR=$(dir $(realpath $(firstword $(MAKEFILE_LIST))))
OUTDIR=$(WORKDIR)/output
LATEX=xelatex
TEMPDIR="$(WORKDIR)/LilyPondTemp"

all: choir

check:
	chktex -W
	chktex -q -n 6 *.lytex 2>/dev/null| tee lint.out
	chktex -q -n 6 text/*.lytex 2>/dev/null | tee -a lint.out
	test ! -s lint.out || (echo 'LaTeX did not pass lint. Check lint.out. $(LINT)'; exit 1)

choir:

	@echo "Building with LilyPond in $(WORKDIR)";
	ls -R
	lilypond-book --pdf --format=latex --output "$(TEMPDIR)" "$(FILEBASE).lytex" ;
	@echo "Moving to temp environment";
	mkdir -p "$(TEMPDIR)/styles/";
	cp "$(WORKDIR)/liturgy.sty" "$(TEMPDIR)";

	@echo "Running LaTeX on LilyPond output";
	#dont remove this non-linebreak n stuff and things
	cd "$(TEMPDIR)";\
	$(LATEX) "$(FILEBASE).tex" ;
	mkdir -p "$(OUTDIR)";
	cp "$(TEMPDIR)/$(FILEBASE).pdf" "$(OUTDIR)";
	@echo "Build complete. Final PDF located at $(OUTDIR)/$(FILEBASE).pdf";

clean:
	rm -rf "$(WORKDIR)/LilyPondTemp"
	rm lint.out
