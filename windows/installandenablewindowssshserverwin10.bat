# A lot of online "Windows How-To Guides" are just scams pushing malware, installing and enabling the OpenSSH Server on Windows 10/11 is that not hard using powershell
# By running these powershell commands on a Windows 11 Evaluation VM on VMWare, you can have a Linux host SFTP/SCP/SSH projects into your lab development machine
# This is ideal for making remotable test virtual machines to test things like malware evasion methods https://developer.microsoft.com/en-us/windows/downloads/virtual-machines/
# Your other option is to 
# Check installed Windows Features, just install the ones not listed as installed
Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH*'
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH*'
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'
cmd.exe /c ""netsh advfirewall firewall add rule name="ssh" dir=in action=allow protocol=TCP localport=22""
cmd.exe /c ""netsh advfirewall firewall add rule name="ssh" dir=out action=allow protocol=TCP localport=22""
cmd.exe /c "net user {password}" # Make a password to login to your VM user which usually is user.

# Then you can check if your Linux VMWare Windows 11 VM SSH server is is up by netcatting to it and then logging in.
# Using something like sftp to drop your test payloads or apps is a lot better than making SMB shares
# Plus you should have used something that can extract .vdm container files to find flagged malware signatures before you do anything.
