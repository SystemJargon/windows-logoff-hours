Part 1 - pihole config in GUI

create a group in pihole called bedtime-restrict

add sites hosts you wish to block at times below to a new adlist called bedtime-restrict

add this adlist to the same named group

add clients say a kids VLAN as a member of this group bedtime-restrict


Part 2 - copy and paste below after issuing in cli of pihole, sudo crontab -e 

Example Enable bedtime-restrict group at 10pm until 6am on every day of week from Sunday through Thursday aka school nights.

0 22 * * 0-4 sqlite3 /etc/pihole/gravity.db "update 'group' set enabled = 1 where name = 'bedtime-restrict'"

0 06 * * 1-5 sqlite3 /etc/pihole/gravity.db "update 'group' set enabled = 0 where name = 'bedtime-restrict'"

0 06 * * 1-5 PATH="$PATH:/usr/sbin:/usr/local/bin/" pihole restartdns
