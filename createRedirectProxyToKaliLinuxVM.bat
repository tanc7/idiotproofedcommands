# This is assuming that your Kali Linux VM has a IP address of 192.168.133.129 from VMWare's NAT mode, setting it to bridged mode is not required and is what are trying to avoid
# https://xringarchery.wordpress.com/2022/04/07/creating-a-redirect-proxy-on-windows-for-kali-linux-attacking-vms-vmware/

netsh advfirewall firewall add rule name="AllowHTTPS" dir=in action=allow protocol=TCP localport=443
netsh advfirewall firewall add rule name="AllowHTTPS" dir=out action=allow protocol=TCP localport=443
netsh interface portproxy add v4tov4 listenport=443 listenaddress=0.0.0.0 connectport=8443 connectaddress=192.168.133.129

