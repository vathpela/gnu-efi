SRCDIR = .

VPATH = $(SRCDIR)
TOPDIR = $(SRCDIR)/..

include $(SRCDIR)/../Make.defaults

all: efi.mk

clean:
	@rm -vf efi.mk

efi.mk : efi.mk.in
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

install: efi.mk
	@$(foreach d,$(INCLUDEDIRS), \
		$(INSTALL) -v -m 755 -d $(subst $(SOURCE),$(DEST),$(d)); \
		$(INSTALL) -v -m 644 -t $(subst $(SOURCE),$(DEST),$(d)) $(wildcard $(d)/*.h $(d)/*.mk); \
	)
	@$(INSTALL) -v -m 644 -t $(DESTINCDIR) efi.mk

.PHONY: install

include $(SRCDIR)/../Make.rules
