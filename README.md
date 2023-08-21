# Useful-Scripts
Userful Powershell scripts i made to save time 
includes: 

UserList Exporting (csv) - 
Script that checks  how many users are in a chosen OU and export a list to csv that includes the username and its status (enabled/disabled)

Computer Exporting (csv) - 
Script that checks  how many computers are in a chosen OU and export a list to csv that includes the computername, its status (enabled/disabled), and last logon date

Inactive Users (csv) - 
Script that checks in a chosen OU for every inactive user (my parameter was 90 days), and export a list to csv

30 Days Password Reset Script (CSV) - 
Checks how many passwords were being reset in the last 30 days and exports a list of every users to CSV on the current user desktop

User Backup - 
Script that backups the current logged user to a network/shared folder 

Recycle Bin Activation -
Script that activates the recycle bin feature on active directory.
only works on windows 2008 R2 and above.

Permission Copy Script - 
Copy Every Security Group from one user to another, can save a ton of time in many cases where your org uses a "Role-Based Access Control"
i had fun using it while watching my peers copy groups one by one.

