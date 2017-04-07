ip=`curl icanhazip.com`
id=$0
title=`basename $id`
termux-clipboard-set $ip
termux-notification -c $ip -t $title -i $id
termux-toast "IP\t$ip"
echo $ip
