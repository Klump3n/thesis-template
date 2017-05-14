# Build a pdf document with latexmk

DOC_NAME=document

LATEXMK=latexmk
PDFTARGET=-pdf -pdflatex="pdflatex -interaction=nonstopmode"
OUT_DIR=-output-directory=build

BUILDCMD=$(LATEXMK) $(DOC_NAME).tex $(PDFTARGET) $(OUT_DIR)

all: build cp-doc

# Build the document
build:
	$(BUILDCMD)

# Copy the built pdf to the main folder
cp-doc: build/$(DOC_NAME).pdf
	@echo "\n## Copying output pdf ##"
	cp -f build/$(DOC_NAME).pdf $(DOC_NAME).pdf

# Remove every file in the build folder
clean:
	$(BUILDCMD) -CA

# Remove all files in the build folder and all pdf files
clean-all: clean build/*
	rm build/*

.PHONY: build clean clean-all
