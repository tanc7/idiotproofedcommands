find . -type f  | xargs sha256sum  | sort -k1,1  | uniq -Dw64
