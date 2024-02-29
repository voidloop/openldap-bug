#!/bin/bash
set -eu
ULIMIT_NOFILE_SYS=$(ulimit -Sn)
ULIMIT_NOFILE_SET=${SLAPD_NOFILE_SOFT:-16384}
ULIMIT_NOFILE=$(( $ULIMIT_NOFILE_SYS < $ULIMIT_NOFILE_SET ? $ULIMIT_NOFILE_SYS : $ULIMIT_NOFILE_SET ))

set -x
ulimit -Sn "$ULIMIT_NOFILE"
make config
exec /usr/sbin/slapd -h "ldap:///" -u ldap -g ldap -d $SLAPD_DEBUG
