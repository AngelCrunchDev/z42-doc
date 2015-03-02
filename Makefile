.PHONY: all
all: sphinx

BUILD_DIR=_build
SPHINXOPTS=-n -W -d $(BUILD_DIR)/doctrees .

.PHONY: html
html:
	sphinx-build -b html $(SPHINXOPTS) $(BUILD_DIR)/html

.PHONY: coverage
coverage:
	sphinx-build -b coverage ${SPHINXOPTS} $(BUILD_DIR)/coverage
	cat build/coverage/python.txt

.PHONY: latex
latex:
	sphinx-build -b latex $(SPHINXOPTS) $(BUILD_DIR)/latex

# Building a pdf requires a latex installation.  For macports, the needed
# packages are texlive-latex-extra and texlive-fonts-recommended.
# The output is in build/latex/tornado.pdf
.PHONY: pdf
pdf: latex
	cd $(BUILD_DIR)/latex && pdflatex -interaction=nonstopmode tornado.tex

clean:
	rm -rf build
