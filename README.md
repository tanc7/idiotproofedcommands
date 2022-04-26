# One of my crappier git repos

I don't expect a lot of recognition for this

# Description

A list of arcane and idiot-proofed commands of convenience to do things such as...

**1. Identify and delete duplicate files by md5sum**

```for i in $(./findmatchingfilesmd5.sh | awk '{print $2}');do echo 'removing' $i;rm -vf $i;echo finished;done```

**2. A full list of the most useful commands in the Red Team Field Manual**

Check Directory RTFM-Commands
