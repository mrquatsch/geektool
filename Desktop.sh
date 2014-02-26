echo "Workstation Name:\t"`scutil --get ComputerName;`
echo "UserName:\t\t\t"`whoami`
#echo "Memory: " `sw_vers | awk -F':t' '{print $2}' | paste -d ' ' - - -; 
echo "Total memory:\t\t"`sysctl -n hw.memsize | awk '{print $0/1073741824" GB of RAM"}'`;
export memTotal=`sysctl -n hw.memsize | awk '{print $0/1048576}'`;
export memUsed=`(top -l 1 | awk '/PhysMem/' | awk '{print $2}';) | cut -d 'M' -f 1  | cut -d 'G' -f 1`;
export memFree=`echo $memTotal - $memUsed | bc`;
export memShortFree=`echo "scale=2;$memFree / 1024" | bc -l`;
export memShortUsed=`echo "scale=2;$memUsed / 1024" | bc -l`;
echo "Free memory:\t\t\t$memShortFree GB of RAM" "- "$(( 100* $memFree / $memTotal ))" %";
echo "Used memory:\t\t$memShortUsed GB of RAM" "- "$(( 100* $memUsed / $memTotal ))" %";
echo "CPU:\t\t\t\t\t"`top -l 2 |awk '/CPU usage/ && NR > 5 {print $3}' | tr '%' ' ' | awk '{print $1"%"}'`
#sysctl -n hw.memsize | awk '{print $0/1073741824" GB RAM"}'; 
echo "Architecture:\t\t\t"`sysctl -n machdep.cpu.brand_string;`
echo `sw_vers -productName;`":\t\t\t"`sw_vers -productVersion;`" - " `sw_vers -buildVersion`
echo "LAN IP Address:\t\t"`ifconfig en0 | grep "inet" | grep -v 127.0.0.1 | grep -v inet6 | awk '{print $2}'`
echo "WAN IP Address:\t\t"`curl -s http://whatsmyip.net/ | grep '<h1 class="ip">' | head -n1 | awk -F'"' '{print $8}'`
sar -n DEV 1 7 | grep -i 'average.*en0'| awk '{printf "DOWN:\t\t\t\t%.2f Kbps\nUP:\t\t\t\t\t%.2f Kbps\n", $4 / 1024, $6 / 1024 }'
