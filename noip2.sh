#! /bin/sh
### BEGIN INIT INFO
# Provides:          mathkernel
# Required-Start:    $local_fs
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: mathkernel
### END INIT INFO
# /etc/init.d/noip2.sh

# Supplied by no-ip.com
# Modified for Debian GNU/Linux by Florian Moesch
# for installation of noip DUC(Desktop update client) see: http://raspberrypihelp.net/tutorials/29-raspberry-pi-no-ip-tutorial
# for instruction for how to install this script see: http://www.stuffaboutcode.com/2012/06/raspberry-pi-run-program-at-start-up.html

. /lib/lsb/init-functions # modify for your init-functions

PROG=/usr/local/bin/noip2
NAME=noip2

test -x $PROG || exit 0

case "$1" in
start)
echo -n "Starting dynamic address update: "
$PROG
echo "$NAME."
;;
stop)
echo -n "Shutting down dynamic address update:"
killall $NAME
echo "$NAME."
;;

restart)
echo -n "Restarting dynamic address update: "
killall $NAME
$PROG
echo "$NAME."
;;

status)
status_of_proc $PROG $NAME && exit 0 || exit $?
;;
*)
echo "Usage: $0 {status|start|stop|restart}"
exit 1
esac
exit 0
