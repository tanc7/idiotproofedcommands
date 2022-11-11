# https://pastebin.com/DpG6bxUV FBI backdoors my college MGT 371 homework at UNLV
# Open a elevated powershell prompt, Ctrl+R powershell and Ctrl+Shift+Enter


1. Kill the UEFI/Firmware bootkit rootkit by reseating the CMOS battery
2. Check disks to delete/fix any hiding spots for 2nd-stage malware from the bootkit because it reclaims lost storage that was allocated by the bootkit/rootkit
3. Run as Admin sfc /scannow to remove inline-hooks and shellcode trampolines in your system DLLs
4. Run as Admin DISM /Online /Cleanup-Image /CheckHealth
5. Briefly turn off Tamper Protection and run powershell script to set threat and incident handling at maximum
`Set-MpPreference -HighThreatDefaultAction Remove -Force;Set-MpPreference -LowThreatDefaultAction Remove -Force;Set-MpPreference -MAPSReporting Advanced -Force;Set-MpPreference -ModerateThreatDefaultAction Remove -Force;Set-MpPreference -SevereThreatDefaultAction Remove -Force;Set-MpPreference -UnknownThreatDefaultAction Remove -Force;Set-MpPreference -DisableRealtimeMonitoring $false -Force;Set-MpPreference -DisableArchiveScanning $false -Force;Set-MpPreference -DisableBehaviorMonitoring $false -Force;Set-MpPreference -DisableBlockAtFirstSeen $false -Force;Set-MpPreference -DisableEmailScanning $false -Force;Set-MpPreference -DisableIntrusionPreventionSystem $false -Force;Set-MpPreference -DisableIOAVProtection $false -Force;Set-MpPreference -DisableRealTimeMonitoring $false -Force;Set-MpPreference -DisableScriptScanning $false -Force;Set-ExecutionPolicy restricted -Force`
6. Run Windows Defender Offline Scan
