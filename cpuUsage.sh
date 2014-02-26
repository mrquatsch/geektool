echo $((100 - `top -l 2 |awk '/CPU usage/ && NR > 5 {print $7}' | tr '%' ' '`)) | awk '{printf "%.2f", $1}' | awk '{print $1"%"}'
