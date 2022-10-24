# A command I used for National Cyber League. I needed to parse out a massive 36GB file of music from all around the worl, then parse out only the ones recorded in the United States, then I had to remove all whitespaces and commas so I can feed it into my ruleset in hashcat. We are assuming that each line of "untrimmedwordlist" is a entry like "Lady Gaga - Poker Face" or something
# Remove all whitespaces per line
cat untrimmedwordlist | sed s/' '/ /g > songwordlist
# Produce a trimmed wordlist by remove all punctuation like './$!# etc
tr -d '[:punct:]' < songwordlist > trimmedsongwordlist
