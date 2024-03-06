#
# Simple example makefile using utils.mk
#

# this ensures that it will still work when make is executed from outside of
# the current directory
# ie: make -f my-project/Makefile
.THIS_DIR := $(dir $(abspath $(firstword $(MAKEFILE_LIST))))

include $(.THIS_DIR)/utils.mk

PROJECT = Example

TARGET = count.txt
SOURCE = README.md

all: $(TARGET)    ## write word/line/character counts to TARGET file

$(TARGET): $(SOURCE)
	wc -c $(SOURCE) >  $(TARGET) # character count
	wc -w $(SOURCE) >> $(TARGET) # word count
	wc -l $(SOURCE) >> $(TARGET) # line count

clean: $(CLEAN_TARGETS)  ## remove local build
	rm $(TARGET)

build: $(BUILD_TARGETS)  ## build locally (default)

view: $(TARGET)  ## display the counts
	@cat $(TARGET)

.DEFAULT_GOAL := all
