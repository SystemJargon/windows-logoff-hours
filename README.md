<!-- Owner source https://github.com/SystemJargon/parental-settings -->

### Basic Requirements

* Windows OS on a computer you wish to put the login-hours stuff to.

* A pi-hole / device with pi-hole and crontab.

* Some reading skills to follow instructions. Copy/paste :)

----

<b>Windows OS</b>

Force logout of current logged in user/s at set time/s AND restrict the logon hours allowed (new logins at login screen). 

Times/users set as variables in included powershell script. Some command line examples provided.

[Guide here](/windows_logon_hours)

----

<b>Pi-Hole</b>

Restrict websites from a list as Pi-hole normally does, but leverage cron and Group Management in Pi-hole. In effect time-based filtering to Group/s.

[Guide here](https://github.com/SystemJargon/pi-hole/tree/main/time-restrict-block-by-group)

