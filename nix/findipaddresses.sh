# My bash history for National Cyber League. Parsing out all unique IP addresses out of a logfile, sorting them and making unique entries, and counting them
 2041  grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" auth.log 
 2042  grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" auth.log | sort | uniq
 2043  grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" auth.log | sort | uniq | wc -l
 2044  history | grep 0-9
 2045  history | grep 0-9 > findipaddresses.sh
