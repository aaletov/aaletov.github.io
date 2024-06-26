THEME=jsonresume-theme-elegant

.PHONY: pdf serve

css:
	mkdir -p ./css
	cp ./node_modules/$(THEME)/style.css ./css/

en:
	npx resumed render ./resume/en/resume.json -t $(THEME) -o ./resume/en/index.html

ru:
	npx resumed render ./resume/ru/resume.json -t $(THEME) -o ./resume/ru/index.html

