# List of all .tex source files
SOURCES = $(wildcard *.tex) $(wildcard content/*) $(wildcard style/*)
NAME = ICT-Digital-Twin

# Main target file
OUTPUT = $(NAME).pdf

.PHONY: zip


# Default rule
all: $(OUTPUT)

# Rule to build the PDF
$(OUTPUT): $(SOURCES)
	@echo "Building PDF..."
	@pdflatex -jobname=$(NAME) main.tex >/dev/null
	@bibtex $(NAME) >/dev/null
	@pdflatex -jobname=$(NAME) main.tex >/dev/null
	@pdflatex -jobname=$(NAME) main.tex >/dev/null
	@echo "Done building"
	#
# Zip target
zip: $(NAME).zip

$(NAME).zip: $(wildcard *)
	@echo "Creating zip file..."
	@zip -r $(NAME).zip $(wildcard *) -x "*.git*"

# Clean rule
clean:
	@echo "Cleaning directory of unnecessary files"
	rm -rf $$(tr '\n' ' ' < .gitignore)
