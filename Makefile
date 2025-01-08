PREFIX = /usr/local

all:
	@./check rootfs

install:
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@install -m 0755 rootfs/home/server/.bin/terraria $(DESTDIR)$(PREFIX)/bin/terraria

uninstall:
	@rm -f $(DESTDIR)$(PREFIX)/bin/terraria

.PHONY: all install uninstall
