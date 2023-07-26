THEME=@jsonresume/jsonresume-theme-class

.PHONY: pdf serve

pdf:
	resume export -t $(THEME) -f .pdf ./resume.pdf

serve:
	resume serve -t $(THEME)
