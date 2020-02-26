g:
	git add .
	git commit -m "$m"
ifeq ($b, f)
	git flow feature finish $f
endif
ifeq ($b, b)
	git flow bugfix finish $f
endif
ifeq ($b, r)
	git flow release finish $f
endif
ifeq ($b, h)
	git flow hotfix finish $f
endif
