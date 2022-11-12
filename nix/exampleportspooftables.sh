iptables -t nat -A PREROUTING -i eth0 -p tcp -m multiport --dport 1:range,afterallowedport:end -j REDIRECT --to-ports 4444
