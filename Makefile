install:
	install -d debian/var/mixmaster $(DESTDIR)/var/mixmaster
	install -d debian/usr/bin $(DESTDIR)/usr/bin
	install -d debian/etc/cron.daily $(DESTDIR)/etc/cron.daily
	install -d debian/etc/lib/systemd/system $(DESTDIR)/lib/systemd/system
	install -m 0644 debian/var/mixmaster/* $(DESTDIR)/var/mixmaster
	install debian/usr/bin/mixmaster $(DESTDIR)/usr/bin/
	install debian/usr/bin/mixmaster-getstats $(DESTDIR)/usr/bin/
	install debian/etc/cron.daily/mixmaster $(DESTDIR)/etc/cron.daily
	install -m 0644 debian/var/mixmaster/.forward $(DESTDIR)/var/mixmaster
	install -m 0644 debian/lib/systemd/system/mixmaster.service $(DESTDIR)/lib/systemd/system
