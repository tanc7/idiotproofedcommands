# One of my crappier git repos

I don't expect a lot of recognition for this. For some scary reasn I have a feeling this repo will get insanely popular....

# Description

A list of arcane and idiot-proofed commands of convenience to do things such as...

**1. Identify and delete duplicate files by md5sum**

This will delete all copies of the file, it could be something like a annoying banner ad that you pulled by cloning a webpage recursively. It also deletes ALL copies, meaning if you want to keep one copy you'll have to improvise on this by <a href="https://superuser.com/questions/1363200/remove-duplicate-files-by-comparing-them-with-md5-recursively">comparing the hashes</a>

Just drop this script somewhere in the path you are trying to clean up

```for i in $(./findmatchingfilesmd5.sh | awk '{print $2}');do echo 'removing' $i;rm -vf $i;echo finished;done```

In the rare event that you fear a hash collision and some jerk made a file with a identical md5 hash to get you to lose it somehow, switch to the sha256sum version

```
for i in $(./findmatchingfilessha256.sh | awk '{print $2}');do echo 'removing' $i;rm -vf $i;echo finished;done
```

**2. Force your Proxmox node to delete a failed disk copy by gunpoint**

Google is dogass for finding good answers but if you failed a VM migration and you want to delete the disk that is wasting space and the GUI tells you the disk is "in use" (it's not, you don't even have a VMID conf file in /etc/pve/qemu-server for it)

```lvremove /dev/disk2/vm-102-disk-0```

Where 102 was the VMID of the failed migration, and /dev/disk2 is the volume of your specific Proxmox cluster's node.

**3. Migrate VM disk in Proxmox to another node in your Proxmox cluster using command line (as the GUI expects you to name all of your disks exactly the same)**

Login to your original node and login as root. Then assuming you called your third node "vhost3", migrate your VM you want to move, and specify the --targetstorage argument and --with-local-disks argument
`qm migrate 116 vhost3 --targetstorage disk3 --with-local-disks`

**4. Mass rename files by its hash between one directory and another**

```
mkdir destinationfolder
chmod +x renamefilebymd5sum.sh
./renamefilebymd5sum.sh sourcefolder destinationfolder
```

**5. Creating a redirect proxy from a Windows 10 host to a attacking Kali Linux VM**

I covered it in this article https://xringarchery.wordpress.com/2022/04/07/creating-a-redirect-proxy-on-windows-for-kali-linux-attacking-vms-vmware/

Essentially this allows you to do local LAN penetration tests by running the script (you will need to modify it to suit your VMWare Kali VM's NATed IP address

`createRedirectProxyToKaliLinuxVM.bat`

I also added a script to clean yourself up after your engagement is done

`deleteRedirectProxyToKaliLinuxVM.bat`

**6. Dynamically resolving your bash terminal session in WSL to its SSH listener**

Please edit it as it defaults to host listening port 3000 to port 22 of your WSL instance, which is actually a Hyper-V VM instance briefly spun up when you type "bash, ubuntu, or kali" on the command line if WSL is installed.

`createARedirectProxyToSSHIntoAWSLVM.ps1`

**7. Create SMB shares between two users on Windows machines and recursively copy a directory using xcopy**

```
createSMBShare.bat
recursivecopydirectoryOverSMB.bat
useSMBShare.bat
```

**8. Change your MAC address in Windows with a powershell script, courtesy of SANS**

<a href="https://www.sans.org/blog/change-random-mac-address-in-windows-with-powershell-script/">SANS Institute Writeup</a>

# Why did I make this repo?

For the last half a decade, finding good documentation for complex, arcane commands on various search engines including Google, is straight up fucking garbo (even with a decent amount of Google Dorking). This was from hours of Googling and usage of DuckDuckGo before I found solutions to issues that many may never end up solving. I decided to make a repo of practical commands for unanswered questions.


For example, the Ipv4 To Ipv4 PortProxy Command is useful for utilizing your Windows host as a attacking machine that redirects shells to your Kali Linux Virtual Machine, which is vital in not giving away your position in a penetration test.

I will not put up commonly documented commands in this repo. Instead, I will focus on trying to solve vague problems, that not even pentester communities were able to publish (or disclose publicly if they knew about it).
