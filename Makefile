include conffiles.mk

package = config
distfiles = Makefile conffiles.mk README

prefix = /usr/local
sysconfdir = $(prefix)/etc

.PHONY: all check dist clean distclean install uninstall

all:

check:

dist:
	rm -R -f -- $(package) $(package).tar $(package).tar.gz
	mkdir -- $(package)
	cp -- $(distfiles) $(package)
	$(MAKE) DESTDIR=$(package)/etc copyetc
	tar -c -f $(package).tar -- $(package)
	gzip -- $(package).tar
	rm -R -f -- $(package) $(package).tar

clean:
	rm -R -f -- $(package) $(package).tar $(package).tar.gz

distclean: clean

install: all
	mkdir -p -- $(DESTDIR)$(sysconfdir)
	$(MAKE) DESTDIR=$(DESTDIR)$(sysconfdir) copyetc
	cd -- $(DESTDIR)$(sysconfdir); chmod -- +x $(execfiles)
	cd -- $(DESTDIR)$(sysconfdir); chmod -- o= $(securefiles)

uninstall:
	cd -- $(DESTDIR)$(sysconfdir); rm -f -- $(conffiles)

.PHONY: copyetc $(conffiles)

copyetc: $(conffiles)

$(conffiles):
	test $(DESTDIR)
	mkdir -p -- $(DESTDIR)/$$(dirname $@)
	cp -f -- etc/$@ $(DESTDIR)/$@
