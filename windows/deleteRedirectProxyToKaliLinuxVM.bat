# Clean up your engagement by removing the redirect proxy and the firewall rules permitting it
# https://xringarchery.wordpress.com/2022/04/07/creating-a-redirect-proxy-on-windows-for-kali-linux-attacking-vms-vmware/
netsh interface portproxy del v4tov4 listenport=443 listenaddress=192.168.1.15
netsh advfirewall firewall show rule status=enabled name=all | FIND /I "allowhttps"
