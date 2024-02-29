#!/bin/bash
ldapmodify -x -D cn=compiled,dc=example,dc=com -w password -H ldap://localhost:53389 <<EOF
dn: uid=ciccio,ou=people,dc=example,dc=com
changetype: modify
replace: uidNumber
uidNumber: 99
EOF
