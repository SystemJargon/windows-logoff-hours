# Part 1 

pihole config in GUI

create a group in pihole called bedtime-restrict

add sites hosts you wish to block at times below to a new adlist called bedtime-restrict

Example Block TikTok and Youtube list, filename pihole-adlist-bedtime-restrict.txt included.

add this adlist to the same named group

add client subnet say a kids VLAN, as a member of this group bedtime-restrict

update gravity via pihole GUI or cli, pihole -g


# Part 2

Example Enable bedtime-restrict group at 10pm until 6am on every day of week from Sunday through Thursday aka school nights.

copy and paste below after issuing in cli of pihole, sudo crontab -e 

<i>0 22 * * 0-4 sqlite3 /etc/pihole/gravity.db "update 'group' set enabled = 1 where name = 'bedtime-restrict'"

0 06 * * 1-5 sqlite3 /etc/pihole/gravity.db "update 'group' set enabled = 0 where name = 'bedtime-restrict'"

0 06 * * 1-5 PATH="$PATH:/usr/sbin:/usr/local/bin/" pihole restartdns </i>
