THEME=@jsonresume/jsonresume-theme-class

.PHONY: pdf serve

css:
	mkdir -p ./css
	cp ./node_modules/$(THEME)/style.css ./css/

en:
	resume export -r ./resume/en/resume.json -t $(THEME) -f .pdf ./resume/en/resume.pdf
	resume export -r ./resume/en/resume.json -t $(THEME) -f .html ./resume/en/resume.html

ru:
	resume export -r ./resume/ru/resume.json -t $(THEME) -f .pdf ./resume/ru/resume.pdf
	resume export -r ./resume/ru/resume.json -t $(THEME) -f .html ./resume/ru/resume.html

# pdf:
# 	resume export -t $(THEME) -f .pdf ./resume.pdf

# html:
# 	resume export -t $(THEME) -f .html 

# serve:
# 	resume serve -t $(THEME)
