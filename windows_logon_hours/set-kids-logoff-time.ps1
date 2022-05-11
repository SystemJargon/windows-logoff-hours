# DO NOT EDIT BELOW THIS LINE

##


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
      Author : https://github.com/lz-eng/parental-settings
#>

#check if powershell is running with admin privilege

function Test-Administrator  
{  
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)  
}

If (Test-Administrator = True) {
    Write-host "Powershell is executed with Administrative privileges"
    }
Else {
    Write-host "This script needs to be executed with Administrative privileges, exiting"
    exit
    } 


## --------------------------------------------------------------------------------------------------------------##

# Set variables so we can easily change this or another parent friend who isn't super tech savvy and without breaking the script
### EDIT BETWEEN THE QUOTE MARKS, USERNAME AND TIMES AS YOU WISH. ###

$username = "kids"
$logofftime = "9pm"

$logonhourstime_school = "Sa-Su,8am-9pm;M-F,3pm-9pm" # school term
$logonhourstime_holidays = "Sa-Su,8am-9pm;M-F,8am-9pm" # school holidays

## --------------------------------------------------------------------------------------------------------------##

# Do not edit below this line unless you know what you are doing.

# WE NEED TO FORCE THE LOGOUT AND SO 'Logon Hours Allowed' below works in conjunction with this.
# Create and register the scheduled task. We may need to delete any existing task with the same name too.
Unregister-ScheduledTask -TaskName "Log Off $username - Time Elapsed" # remove the existing task
$action = New-ScheduledTaskAction -Execute 'Powershell.exe' '-NoProfile -WindowStyle Hidden -command "&(shutdown /l /f)"'
$trigger =  New-ScheduledTaskTrigger -Daily -At $logofftime
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "Log Off $username - Time Elapsed" -Description "Log Off $username each day at set time. Time Elapsed" -User $username

# --------------------------------------------------------------------------------------------------------------#

# THIS WILL PREVENT THE USER OF A LOGIN BUT ONCE AT THE LOGON SCREEN. NOT IF ALREADY LOGGED IN.
# Also set this for 'logon hours allowed'.

### CAN CHANGE THE LOGONHOURSTIME BETWEEN QUOTE MARKS TO EITHER. NOTE # or any number of # IS A COMMENT LINE.
## $logonhourstime_school
## or $logonhourstime_school

net user $username /time:"$logonhourstime_holidays"

