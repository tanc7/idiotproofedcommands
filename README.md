# One of my crappier git repos

I don't expect a lot of recognition for this

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

