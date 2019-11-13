SRCDIR = .

VPATH = $(SRCDIR)
TOPDIR = $(SRCDIR)/..

include $(SRCDIR)/../Make.defaults

# deliberately not putting efi.mk.3 in all, because PREFIX is often
# not passed before "make install".
all: efi.mk

clean:
	@rm -vf efi.mk

efi.mk efi.mk.3 : % : %.in
	sed \
		-e 's,@@CC@@,$(CC),g' \
		-e 's,@@PREFIX@@,$(PREFIX),g' \
		-e 's,@@INCDIR@@,$(PREFIX)/include/efi,g' \
		-e 's,@@GNUEFIDIR@@,$(LIBDIR)/gnuefi/$$(EFI_ARCH),g' \
		-e 's,@@LIBEFIDIR@@,$(LIBDIR)/gnuefi/$$(EFI_ARCH),g' \
		$^ > $@

SOURCE=$(realpath $(SRCDIR))
DESTINCDIR=$(INSTALLROOT)$(PREFIX)/include
DEST=$(DESTINCDIR)/efi
INCLUDEDIRS=$(sort $(shell find $(SOURCE) -type d))
MANDIR ?= $(PREFIX)/share/man

install: efi.mk efi.mk.3
	@$(foreach d,$(INCLUDEDIRS), \
		$(INSTALL) -v -m 755 -d $(subst $(SOURCE),$(DEST),$(d)); \
		$(INSTALL) -v -m 644 -t $(subst $(SOURCE),$(DEST),$(d)) $(wildcard $(d)/*.h $(d)/*.mk); \
	)
	@$(INSTALL) -v -m 644 -t $(DESTINCDIR) efi.mk
	@$(INSTALL) -v -m 755 -d $(INSTALLROOT)$(MANDIR)/man3
	@$(INSTALL) -v -m 644 -t $(INSTALLROOT)$(MANDIR)/man3 efi.mk.3

.PHONY: install

include $(SRCDIR)/../Make.rules
