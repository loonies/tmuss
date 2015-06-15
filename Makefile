.SUFFIXES:

SHELL = /bin/sh

prefix ?= /usr/local
bindir = $(prefix)/bin

RM      = rm -f
INSTALL = install

.PHONY: help
help:
	@echo "Usage: make [<options>] [<target>]"
	@echo ""
	@echo "Options:"
	@echo "  prefix=<path>  Set alternate installation path"
	@echo ""
	@echo "Targets:"
	@echo "  help       Display help"
	@echo "  install    Install program"
	@echo "  uninstall  Uninstall program"

.PHONY: install
install:
	$(INSTALL) -d -m 0755 $(bindir)
	$(INSTALL) -m 0755 src/tmuss $(bindir)

.PHONY: uninstall
uninstall:
	$(RM) $(bindir)/tmuss

