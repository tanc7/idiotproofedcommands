https://www.thegeekstuff.com/2016/03/cryptsetup-lukskey/
https://www.kali.org/blog/nuke-kali-linux-luks/

# Overview and demystifying data destruction of SSDs and flash memory.

Contrary to what the idiot shitposters on the internet speak of when it comes to "overwriting hard drives with zeroes or random data" to prevent recovery, that is a whole load of shit when it comes to FLASH memory.

There are research papers on proper data destruction of SSDs and flash drives and NO cleaner has succeeded in producing irrecoverable SSD drives if your SSD is taken in for analysis for God knows what you do. If you have found those research papers that I am referring to, the testing of "data destruction software" for SSDs, please put in a pull request. Because Google is the mouthpiece of the new Bigtech Nazi Party and I couldn't find the specific research papers dating back to 2010s-2013s

The reason why is that SSD drives vary in methods of preserving it's integrity and operation. Usually, it tries to save itself from using up it's limited read/writes. So using dd if=/dev/urandom of=/dev/wholedisk will not work. Some asshole on the internet came up with the term "wear-leveling" to describe this. Probably because they wanted to keep their job instead of wasting air.

Data on flash memory is negatively charged electrons stored on cells. What happens if you attempt to overwrite it with random data? You'll corrupt the data, but depending on what shit drive you bought, it may be just overwriting the same exact cluster of cells instead of the whole drive.

# How to do this properly.

First of all, you ALWAYS need to have LUKS on your drive. Before you do ANYTHING. Before you even install your operating system, you should have already enabled LUKS encryption.

When you suspect that your disks are going to be taken in for forensic analysis, DELETE all the keys that are valid and immediately POWER DOWN the device.

# You enumerate your keys by the cryptsetup command

`cryptsetup luksDump /dev/sdb1` and determine whether or not there are keys to be removed

# Method one, luksRemoveKey

`cryptsetup luksRemoveKey /dev/sdb1` 

Keep doing this, including deleting your final key.

# Method two, luksKillSlot

`cryptsetup luksKillSlot /dev/sdb1 2` for the second slot

Once you deleted all of your LUKS keys, your final one will have you look at a prompt asking for a capital YES. Enter YES and shutdown your machine.


# This is significantly faster than overwriting hard disks, destroying them like Mr. Robot, or running magnets like that shitty movie The Core.

You can delete your own LUKS key to prevent data recovery in seconds. 

# All that there is left to analyze is undecryptable data.

Because NO key, not even the CORRECT key can decrypt it.

# What if you forgot to set up LUKS?

*Well then you're fucked*. No not really. But it's going to be a lot slower. But if it's a Linux host, you can either, set up LUKS encryption and follow the key deletion methods I mentioned above, or if it IS a ordinary spinning disk you can do this

`for i in $(sudo fdisk -l | grep /dev/sd | grep Disk | cut -d \: -f1 | awk -F 'Disk ' '{print $2}');do nohup sudo dd if=/dev/urandom of=$i > nohup.out < /dev/null &;done`

Note grepping for `/dev/sd`, for online VPSes it could be a /dev/vdX device, so change from `/dev/sd` to `/dev/vd`

# If you are a bit late, you can try preinstalling your machines with shufflecake so you can give out the wrong password under coercion.

shufflecake.net
