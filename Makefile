# List of all .tex source files
SOURCES = $(wildcard *.tex) $(wildcard content/*) $(wildcard style/*)
NAME = ICT-Digital-Twin

# Main target file
OUTPUT = $(NAME).pdf

# Default rule
all: $(OUTPUT)

# Rule to build the PDF
$(OUTPUT): $(SOURCES)
	@pdflatex -jobname=$(NAME) main.tex >/dev/null
	@bibtex $(NAME) >/dev/null
	@pdflatex -jobname=$(NAME) main.tex >/dev/null
	@pdflatex -jobname=$(NAME) main.tex >/dev/null

# Clean rule
clean:
	rm -f *.aux *.bbl *.blg *.log *.fls *.fdb_latexmk *.toc *.lof *.lot *.out main.synctex.gz

