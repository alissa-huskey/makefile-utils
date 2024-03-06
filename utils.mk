#
# Makefile end user utilities
#

.THIS_DIR := $(dir $(abspath $(firstword $(MAKEFILE_LIST))))
PROJECT ?= $(lastword $(subst /, , $(THIS_DIR)))

ifdef NOCOLOR
	.colorize := cat
else
	# use awk to colorize the first value every tab separated line
	.colorize := awk -F $$'\t' '{printf("\033[36m%s\033[0m \t%s\n", $$1, $$2)}'
endif

.prettify := $(.colorize) | column -ts $$'\t'

# get a list of variables and values
# excluding any that start with .
# in a list of space seperated var=value; strings
define .vars
	$(foreach V, \
		$(sort $(.VARIABLES)), \
		$(if \
			$(and \
				$(filter-out .%, $V ), \
				$(filter-out environment% default automatic, $(origin $V) ) \
			), \
			$V:$($V)\; \
		) \
	)
endef

.PHONY: help
help:  ## list targets
	@echo $(PROJECT) Makefile
	@echo
	@echo Usage: make \<target\>
	@echo 
	@sed -ne '/^[a-z%-]\+:.*##/ s/:.*##/\t/p' $(MAKEFILE_LIST) \
		| $(.prettify)

.PHONY: vars
vars:        ## print current value of all vars
	@echo $(call .vars) \
		| sed 's/;$$// ; s/;\s*/\n/g ; s/:/\t: /g ; s/^\s*//g' \
		| $(.prettify)
