git:
	git add .
	git commit -m "$m"
ifeq ($b, b)
	git flow bugfix finish $f
endif
ifeq ($b, f)
	git flow bugfix finish $f
endif
