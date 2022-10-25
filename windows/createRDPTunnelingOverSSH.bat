# Both Linux and Windows Commands (Linux has more reliable SSH clients that are not annoying as fuck)
# On some sort of Linux machine like a container at your home cluster (I use a proxmox LXC container running Debian)
ssh -Nf root@REMOTEIP -R remoteport:localwindowsmachineip:3389
# Now login to your server at REMOTEIP
screen -S rdp
socat -v TCP-L:newremoteport,reuseaddr,fork tcp4:localhost:remoteport
Ctrl A+D to background it
# Now from your Linux machine that you want to login to the Windows machine at your house, create a tunnel pointing to that remote port from socat
ssh -Nf -L 3389:127.0.0.1:newremoteport root@REMOTEIP
xfreerdp /u:username /p:password /v:localhost /f

