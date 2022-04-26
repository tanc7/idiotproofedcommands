find . -type f \
    | xargs sha256sum \
    | sort -k1,1 \
    | uniq -Dw64 \
    | while read hash file; do 
        [ "${prev_hash}" == "${hash}" ] && rm -v "${file}"
        prev_hash="${hash}"; 
    done
