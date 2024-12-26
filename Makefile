.PHONY: install update

PORT       ?= 4000
EXPORT_DIR ?= _site

BUNDLE ?= $(shell which bundle)
PYTHON ?= $(shell which python)

install:
	$(BUNDLE) install
update:
	$(BUNDLE) update

serve:
	$(BUNDLE) exec jekyll serve --port ${PORT} --host 0.0.0.0
build:
	$(BUNDLE) exec jekyll build -d "${EXPORT_DIR}"
bserve: build
	cd ${EXPORT_DIR} && \
		$(PYTHON) -m http.server ${PORT} --bind 0.0.0.0
