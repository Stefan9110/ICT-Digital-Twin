SOURCES = $(wildcard *.tex) $(wildcard content/*) $(wildcard style/*) $(wildcard preface/*) $(wildcard images/*)
NAME = ICT-Digital-Twin
OUTPUT= $(NAME).pdf
.PHONY: pdf final clean sign verify

# ========================================
# MAIN EXECUTABLE MAKE RULES
# CLICK ON THE GREEN BUTTON TO RUN
# AND ADD TO YOUR CLION CONFIGURATION
# ========================================

# Compile current version of the document
pdf: build/$(OUTPUT)

# Make final PDF version of the document
final: final/$(OUTPUT)

# Clean the build directory
clean:
	@echo "Cleaning directory of unnecessary files"
	rm -rf $$(tr '\n' ' ' < .gitignore)

# ========================================
# IGNORE EVERYTHING BELOW THIS LINE
# ========================================

build/$(OUTPUT): $(SOURCES)
	@echo "Building PDF..."
	@./scripts/build.sh $(NAME)
	@echo "Done building PDF."

final/$(OUTPUT): $(SOURCES)
	@echo "Creating final version of the PDF..."
	@./scripts/build.sh $(NAME) "final"
	@rm -rf final/$(NAME).aux final/$(NAME).log final/$(NAME).out final/$(NAME).toc final/main.bib final/$(NAME).bbl final/$(NAME).blg
	@echo "Done creating final version of the PDF."
