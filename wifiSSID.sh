printf "s:  `/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I | grep -i ssid | grep -iv BSSID | awk '{print $2, $3, $4, $5, $6}'`\n"
