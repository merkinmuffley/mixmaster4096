install: debian/usr/bin/mixmaster
	sudo install debian/usr/bin/mixmaster /usr/bin/
	sudo install -d debian/var/mixmaster /var/mixmaster
	sudo install -m 0644 debian/var/mixmaster/* /var/mixmaster
	sudo install -m 0644 debian/var/mixmaster/.forward /var/mixmaster
	sudo install -m 0644 debian/lib/systemd/system/mixmaster.service /lib/systemd/system/
