gen-web:
	shiroa build -d ./docs --path-to-root training-book

serve-web:
	python3 -m http.server 8000 -d ./docs

.PHONY: gen-web serve-web
