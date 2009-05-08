all: build

SRCDIR := .

include ../../../Makefile.common

TARGETS := $(INSTALL)/usr/lib/libapxml.dylib

build: $(TARGETS)

$(INSTALL)/usr/lib/libapxml.dylib: $(call srcdir-objs)

$(INSTALL)/usr/lib/libapxml.dylib: \
	LDFLAGS += -install_name /usr/lib/libapxml.dylib \
	-framework UIKit

$(INSTALL)/usr/lib/libapxml.dylib: \
	LDLIBS += 

clean:
ifeq ($(PLATFORM),phone)
	@echo "CLEAN      " $(CURDIR)
else
	$Q$(MAKE) PLATFORM=phone clean
endif
	$Qrm -rf $O $(TARGETS)
