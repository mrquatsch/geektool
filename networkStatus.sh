sar -n DEV 1 7 | grep -i 'average.*en0'| awk '{printf "DOWN:  %.2f Kbps\nUP      :  %.2f Kbps\n", $4 / 1024, $6 / 1024 }'
