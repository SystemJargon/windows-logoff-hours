Open the commaand prompt as Administrator, powershell can work but may not recognize multi-string days using ";".

Replace username "kids" with whatever username is desired.

Day format is, Su, M, T, W, Th, F, Sa

uses 12 hour clock, not 24 hour clock.

## EXAMPLES ##

#To add all days of the Week and allow only login between 10am to 10pm.
net user kids /time:M-Su,10am-10pm

# To remove any logon hours
net user kids /time:ALL

# To restrict ALL logon hours (none allowed)
net user kids /time:

# Multiple days string with limits (or use just single days if wanted)
net user kids /time:Sa-Su,8am-9pm;M-F,4pm-9pm
