#!/bin/bash
# Sync Jam otomatis berdasarkan bug isp by AlkhaNET
# Mod Script Extended GMT+7 by Vito Harhari

echo -e "jam.sh : Stopping Tunnel"
logger "jam.sh : Stopping Tunnel"
/etc/init.d/passwall stop

    curl -i https://myorbit.id/kuota-habis/ | grep date > /tmp/date
    curl -i https://myorbit.id/kuota-habis/ | grep date > /tmp/date
    day=$(cat /tmp/date | cut -b 12-13)
    month=$(cat /tmp/date | cut -b 15-17)
    year=$(cat /tmp/date | cut -b 19-22)
    time=$(cat /tmp/date | cut -b 24-31)
    kalender=$(/bin/date)
    
    
    case $month in
        "Jan")
           month="01"
            ;;
        "Feb")
            month="02"
            ;;
        "Mar")
            month="03"
            ;;
        "Apr")
            month="04"
            ;;
        "May")
            month="05"
            ;;
        "Jun")
            month="06"
            ;;
        "Jul")
            month="07"
            ;;
        "Aug")
            month="08"
            ;;
        "Sep")
            month="09"
            ;;
        "Oct")
            month="10"
            ;;
        "Nov")
            month="11"
            ;;
        "Dec")
            month="12"
            ;;
        *)
           continue

    esac

date -u -s $year.$month.$day-$time

echo -e "jam.sh : Waiting restarting tunnel"
logger "jam.sh : Waiting restarting tunnel"
/etc/init.d/passwall restart

echo -e "jam.sh : Set Time to : $kalender"
logger "jam.sh : Set Time to : $kalender"

rm /tmp/date
echo -e "jam.sh : Proses Sync is Completed"
logger "jam.sh : Proses Sync is Completed"
