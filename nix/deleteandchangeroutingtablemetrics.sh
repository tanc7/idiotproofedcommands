# Some worthless dumbfuck couldn't document these commands correctly even though the commands to do so have been present for years.
# If you have two DHCP servers, you want to specify a specific route and IP address

0.0.0.0         192.168.1.1     0.0.0.0         UG    100    0        0 wirelessdevicename

# Delete the old route because you may not be getting internet access because of routing table errors
route del -net 0.0.0.0 gw 192.168.1.1 mask 0.0.0.0 wirelessdevicename
# Re-add the route with a lower metric so it takes priority
route add -add 0.0.0.0 gw 192.168.1.1.1 mask 0.0.0.0 wirelessdevice metric 5
sudo route del -net 0.0.0.0 gw 192.168.1.1 netmask 0.0.0.0 dev wirelessdevicename
sudo route add -net 0.0.0.0 gw 192.168.1.1 netmask 0.0.0.0 dev wirelessdevicename metric 100
# NetworkManager GUI is written by morons and won't let you easily disconnect and change your routing tables. To make this automatic, use nmcli to change the static route where Network is your wireless network's name
nmcli connection modify Network ipv4.routes "0.0.0.0/1 192.168.1.1" ipv4.route-metric 5
