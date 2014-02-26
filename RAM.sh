echo "Total memory:\t\t"`sysctl -n hw.memsize | awk '{print $0/1073741824" GB of RAM"}'`;
export memTotal=`sysctl -n hw.memsize | awk '{print $0/1048576}'`;
export memUsed=`(top -l 1 | awk '/PhysMem/' | awk '{print $2}';) | cut -d 'M' -f 1  | cut -d 'G' -f 1`;
export memFree=`echo $memTotal - $memUsed | bc`;
export memShortFree=`echo "scale=2;$memFree / 1024" | bc -l`;
export memShortUsed=`echo "scale=2;$memUsed / 1024" | bc -l`;
echo "Free memory:\t\t\t$memShortFree GB of RAM" "- "$(( 100* $memFree / $memTotal ))" %";
echo "Used memory:\t\t$memShortUsed GB of RAM" "- "$(( 100* $memUsed / $memTotal ))" %";
