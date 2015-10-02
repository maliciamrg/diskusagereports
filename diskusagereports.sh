#!/bin/bash
# exit if I am already running
# bloquer : kill $(pgrep java)
NOW=$(date +"%F %T")
outfile="/var/www/html/diskusagereports/Log/diskusagereports-`date +%Y-%m-%d`.html"
echo "UndoubleScript Launch-"$NOW >> $outfile
exec 9<$0
flock -n 9 || exit 1
cd /var/www/html/diskusagereports/
sleep 20
 bash scripts/find.sh / | php scripts/process.php data/myreport   >> $outfile 2>&1 
echo "UndoubleScript Exit---"$NOW >> $outfile
