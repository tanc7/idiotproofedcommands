find . -type f  | xargs md5sum  | sort -k1,1  | uniq -Dw32
