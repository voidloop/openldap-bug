#!/bin/bash
ldapmodify -x -D cn=buggy,dc=example,dc=com -w password -H ldap://localhost:52389 <<EOF
dn: uid=ciccio,ou=people,dc=example,dc=com
changetype: modify
replace: uidNumber
uidNumber: 99
EOF
