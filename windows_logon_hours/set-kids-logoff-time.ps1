<# .SYNOPSIS
      Make a scheduled task to log off a user and set specific logon hours 
.DESCRIPTION
      Make a scheduled task to log off a user and set specific logon hours.    
.NOTES
      This was written for a kids user and does not require ActiveDirectory. It is a local account.
      Replace times and username 'kids' with your own requirements.
      I could make this a function psm1 file, but a ps1 I feel is more suited because it should be runonce, not often and a set-forget type situation.
      Any regular or heavy usage would be better controlled by something like AD or similar with central management of user objects.
      
.CREDIT
      Author : https://github.com/lwsnz
#>

# Create and register the scheduled task. 
# WE NEED TO FORCE THE LOGOUT AND SO 'Logon Hours Allowed' below works in conjunction with this.
# Set variables so we can easily change this or another parent friend without breaking the script
$username = "kids"
$time = "9pm"

# DO NOT EDIT BELOW THIS LINE
$action = New-ScheduledTaskAction -Execute 'Powershell.exe' '-NoProfile -WindowStyle Hidden -command "&(shutdown /l /f)"'
$trigger =  New-ScheduledTaskTrigger -Daily -At $time
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "Log Off Kids - Time Elapsed" -Description "Log Off Kids each day at set time. Time Elapsed" -User $username

# YOU MAY EDIT THIS IF YOU WISH. THIS WILL PREVENT THE USER OF A LOGIN BUT ONCE AT THE LOGON SCREEN. NOT IF ALREADY LOGGED IN.
# Also set this for 'logon hours allowed'.
net user kids /time:"Sa-Su,8am-9pm;M-F,4pm-9pm"
