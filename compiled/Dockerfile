FROM fedora:39

RUN dnf install -y gcc autoconf automake libtool cyrus-sasl-devel openssl-devel gdb

COPY ./src/openldap/. /usr/local/src/openldap/
COPY ./src/translucent.c /usr/local/src/openldap/servers/slapd/overlays/

WORKDIR /usr/local/src/openldap/
RUN ./configure --prefix /usr --sysconfdir /etc --libexecdir /usr/sbin\
 --enable-translucent --enable-ldap --enable-mdb --enable-debug
RUN make -j $(nproc) && make install

COPY ./start-slapd.sh /usr/local/bin/
COPY ./Makefile /etc/openldap/

RUN chmod +x /usr/local/bin/start-slapd.sh

WORKDIR /etc/openldap/
RUN make clean

RUN useradd ldap -s /usr/sbin/nologin --system -d /var/lib/ldap
RUN mkdir -p /var/lib/ldap
RUN chown -v ldap:ldap /var/lib/ldap

EXPOSE 389

CMD '/usr/local/bin/start-slapd.sh'
