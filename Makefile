THEME=jsonresume-theme-elegant

.PHONY: pdf serve

css:
	mkdir -p ./css
	cp ./node_modules/$(THEME)/style.css ./css/

en:
	resume export -r ./resume/en/resume.json -t $(THEME) -f .pdf ./resume/en/resume.pdf
	resume export -r ./resume/en/resume.json -t $(THEME) -f .html ./resume/en/index.html

ru:
	resume export -r ./resume/ru/resume.json -t $(THEME) -f .pdf ./resume/ru/resume.pdf
	resume export -r ./resume/ru/resume.json -t $(THEME) -f .html ./resume/ru/index.html

ru-serve:
	resume serve -r ./resume/ru/resume.json -t $(THEME) -p 8080
	
en-serve:
	resume serve -r ./resume/en/resume.json -t $(THEME) -p 8081
