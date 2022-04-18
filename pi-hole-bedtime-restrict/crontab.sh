0 22 * * 0-4 sqlite3 /etc/pihole/gravity.db "update 'group' set enabled = 1 where name = 'bedtime-restrict'"

0 06 * * 1-5 sqlite3 /etc/pihole/gravity.db "update 'group' set enabled = 0 where name = 'bedtime-restrict'"

0 06 * * 1-5 PATH="$PATH:/usr/sbin:/usr/local/bin/" pihole restartdns
