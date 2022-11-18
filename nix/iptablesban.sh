iptables -A INPUT  -s 1.2.3.4 -j DROP
# Feds regularly use IPSec, specifically HAIPE, built on top of IPSec for top secret communications, see General Dynamics Mission Systems TACLANE Series

root@pve:~# iptables -A OUTPUT -p udp --dport 500 -j DROP
root@pve:~# iptables -A OUTPUT -p udp --dport 4500 -j DROP
# /sbin/iptables -L -n -v
# /sbin/iptables -L -n -v | grep port
# /sbin/iptables -L -n -v | grep -i DROP
# /sbin/iptables -L OUTPUT -n -v
# /sbin/iptables -L INPUT -n -v
# Make a save
iptables-save > file
# Restore a save 
iptables-restore < file
