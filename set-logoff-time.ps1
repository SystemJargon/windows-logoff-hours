#Requires -RunAsAdministrator

# A powershell script to resolve login times for kids.

# name this script as logon-policy-username.ps1 and replace username per user to execute this script for. 
# example logon-policy-bobby.ps1 logon-policy-angelica.ps1 and change up the times between them is desired.

# Variables for Scheduled Task to force the logout
$username = "kids" # replace as required
$logofftime = "9pm" # replace as required

# Variables for the Logon Hours allowed once logged out / not already logged in.
$logonhourstime_school = "Sa-Su,8am-9pm;M-F,3pm-9pm" # school term
# $logonhourstime_noschool = "Sa-Su,8am-9pm;M-F,8am-9pm" # school holidays


########### Do not edit below this line unless you know what you are doing. ###########
## --------------------------------------------------------------------------------------------------------------##

## SCHEDULED TASK TO FORCE LOGOUT
# This section is to force the logout of said user/s at times defined using a scheduled task.
# Create and register the scheduled task. We may need to delete any existing task with the same name too.
# Do not edit between these dotted lines as they use all variables for input of time and username

Unregister-ScheduledTask -TaskName "Log Off $username - Time Elapsed" # remove the existing task
$action = New-ScheduledTaskAction -Execute 'Powershell.exe' '-NoProfile -WindowStyle Hidden -command "&(shutdown /l /f)"'
$trigger =  New-ScheduledTaskTrigger -Daily -At $logofftime
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "Log Off $username - Time Elapsed" -Description "Log Off $username each day at set time. Time Elapsed" -User $username

# --------------------------------------------------------------------------------------------------------------#

## USER POLICY FOR LOGON HOURS
# THIS WILL PREVENT THE USER FOR NEW LOGINS AT TIMES DEFINED. VALID ONCE THE USERNAME HAS BEEN LOGGED OUT ALREADY (IN PART BY THE ABOVE SECTION).
# Utilizies Windows feature 'Logon Hours Allowed'.
# IF they are logged in already, the above ## FORCE-LOGOUT-HOURS section will take care of this.

### CAN CHANGE THE LOGONHOURSTIME BETWEEN QUOTE MARKS TO EITHER. NOTE # or any number of # IS A COMMENT LINE and WILL not be used.


net user $username /time:"$logonhourstime_school"
#net user $username /time:"logonhourstime_noschool"

