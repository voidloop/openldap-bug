CONFIGDIR = /etc/openldap/slapd.d/cn=config

config: | $(CONFIGDIR)

$(CONFIGDIR):
	/usr/sbin/slapadd -n0 -F /etc/openldap/slapd.d -l /etc/openldap/slapd.ldif
	slapadd -n2 -F /etc/openldap/slapd.d -l entries.ldif
	chown -R ldap:ldap /etc/openldap/slapd.d
	chown -R ldap:ldap /var/lib/ldap

clean:
	rm -rf /etc/openldap/slapd.d/*

.PHONY: config clean
