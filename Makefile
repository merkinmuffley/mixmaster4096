install: debian/usr/bin/mixmaster
	install debian/usr/bin/mixmaster /usr/bin/
	install -d debian/var/mixkeys /var/mixkeys
	install -d debian/var/mixmaster /var/mixmaster
	install -m 0644 -o mix debian/var/mixmaster/* /var/mixmaster
