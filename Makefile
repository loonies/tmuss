.SUFFIXES:

SHELL = /bin/sh

prefix ?= /usr/local
bindir  = $(prefix)/bin
mandir  = $(prefix)/share/man

RM      = rm -f
INSTALL = install
RONN    = ronn --pipe

RONNATTR = --manual="Tmuss Manual" --organization="tmuss 0.1.0-alpha"

.PHONY: help
help:
	@echo "Usage: make [<options>] [<target>]"
	@echo ""
	@echo "Options:"
	@echo "  prefix=<path>  Set alternate install/uninstall path"
	@echo ""
	@echo "Targets:"
	@echo "  help       Display help"
	@echo "  install    Install program"
	@echo "  man        Generate man pages"
	@echo "  uninstall  Uninstall program"

.PHONY: man
man:
	$(RONN) --roff $(RONNATTR) doc/tmuss.1.ronn > doc/tmuss.1
	$(RONN) --roff $(RONNATTR) doc/tmuss.profile.5.ronn > doc/tmuss.profile.5

.PHONY: install
install:
	$(INSTALL) -d -m 0755 $(bindir)
	$(INSTALL) -d -m 0755 $(mandir)/man1
	$(INSTALL) -d -m 0755 $(mandir)/man5

	$(INSTALL) -m 0755 src/tmuss $(bindir)
	$(INSTALL) -m 0644 doc/tmuss.1 $(mandir)/man1/tmuss.1
	$(INSTALL) -m 0644 doc/tmuss.profile.5 $(mandir)/man5/tmuss.profile.5

.PHONY: uninstall
uninstall:
	$(RM) $(bindir)/tmuss
	$(RM) $(mandir)/man1/tmuss.1
	$(RM) $(mandir)/man5/tmuss.profile.5

