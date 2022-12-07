# For some reason, installing VPN clients like ZeroTier and PrivateInternetAccess may cause your wireless card to fail after a suspended state (opening the laptop at school for example)
# open a administrative command prompt Windows+R and cmd.exe and Ctrl+Shift+Enter
wmic nic get name, index
# Find the index that represents your wireless card and disable it for me its #4
wmic path win32_networkadapter where index=4 call disable
# Then reenable it
wmic path win32_networkadapter where index=4 call enable
