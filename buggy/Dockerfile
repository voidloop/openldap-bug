FROM fedora:39

RUN dnf install -y openldap-servers make

COPY ./start-slapd.sh /usr/local/bin/
COPY ./Makefile /etc/openldap/

RUN chmod +x /usr/local/bin/start-slapd.sh

WORKDIR /etc/openldap

RUN make clean

EXPOSE 389

CMD '/usr/local/bin/start-slapd.sh'
