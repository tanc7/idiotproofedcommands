# Both Linux and Windows Commands (Linux has more reliable SSH clients that are not annoying as fuck)
# On some sort of Linux machine like a container at your home cluster (I use a proxmox LXC container running Debian)
ssh -Nf root@REMOTEIP -R 50000:localwindowsmachineip:3389
# Now login to your server at REMOTEIP
screen -S rdp
socat -v TCP-L:50001,reuseaddr,fork tcp4:localhost:50000
Ctrl A+D to background it
# Now from your Linux machine that you want to login to the Windows machine at your house, create a tunnel pointing to that remote port from socat
ssh -Nf -L 3389:127.0.0.1:50001 root@REMOTEIP
xfreerdp /u:username /p:password /v:localhost /f
# FAQ: So why not create a VPN or use ZeroTier? A: Sometimes you don't want to have a persistent tunnel running or spend the time to put one up. The fastest way is to use ZeroTier and keep it as a private SDN. But what if I just wanted to create a tunnel that I can easily collapse because all I wanted to do is make a configuration change, never intending to ever allow remote access for a while or ever again?
# FAQ: Why are you tunneling a RDP session through SSH? A: Go run a wireshark packet capture and you can easily discover that on unprotected networks, you can not only enumerate the endpoint IP, but also the hostname and username of the RDP authentication attempt (but not the password which is protected by it's forward-secrecy protocol). If you created a SSH port forwarded tunnel first, all attackers can see on the LAN is encrypted SSH tunnel traffic and the IP address of the endpoint of your public IP (your rented VPS).
