<!-- Owner source https://github.com/SystemJargon/parental-settings -->

# parental-settings

### Why

This came about in a conversation with a friend who has children. They are a somewhat tech savvy (can follow instructions), wanted something existing/opensource, privacy maintained if possible and not cost an arm and a leg. Something that would logout and prevent new logins at a certain time. Then also prevent certain traffic at certain times. You may have a similar use case if a parent.

This existing/just works/easy config, is of course compared to paying some 3rd party for a solution. There maybe other solutions out there which are free too. The use case for this again was *existing/opensource, privacy maintained if possible and not cost an arm and a leg*


### What this does

This is for Windows OS. Force logout at set time/s and restrict the logon hours allowed (at login screen). Times/users set as variables in powershell script. 2nd Part, restrict websites by group+list at defined times (in conjunction with Pi-Hole). 

*MacOS / other OS's may have existing parental controls, which is not covered by this repo.

### Basic Requirements

* This will require pi-hole installed.

* Copy/Paste for commandline / Run a powershell Script (edit 2 approx lines for username, time variable to suit your own requirements).

----


## Restrict logon hours on Windows OS

This is covered here, [Restrict logon hours on Windows OS](/windows_logon_hours)


## Pi-hole stuff / Block traffic at certain times.

[Pi-hole time restrict block by group](https://github.com/SystemJargon/pi-hole/tree/main/time-restrict-block-by-group)


Use case, restrict sites/hosts at bedtime defined hours via PiHole (unless you just turn off a seperate wifi SSID).


Info about PiHole if your new, visit https://docs.pi-hole.net/



----

## Alternative methods for content-filtering and children

### Hosts file 

If you do not use pihole and rather just use Windows hosts file to filter safesearch or youtube safe etc. have a look at [windows-hosts-file](https://github.com/SystemJargon//windows-hosts-file) instead. Note, this won't be based on certain times (it will apply always once the hosts file is saved).


### Use filtering Upstream Public DNS providers
Other alternatives you could use besides a hosts file, AdguardHome or Pi-hole;

[OpenDNS](https://www.opendns.com/setupguide/#familyshield)

[NextDNS](https://nextdns.io)

And many more not listed here.
