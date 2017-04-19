set -e

destination="/sdcard/Android/data/org.xbmc.kodi/files/.kodi/userdata/playercorefactory.xml"
command=$1
kodiuser=u0_a306
kodigroup=sdcard_rw

if [ "$command" == "update" ]
then
    source="$HOME/kodi/playercorefactory.xml"
    cp "$source" "$destination"
    chown $kodiuser:$kodigroup "$destination"
    echo 'kodi -> chrome'
elif [ "$command" == "remove" ]
then
     rm "$destination"
     echo 'kodi -> kodi'
else
    echo "invalid command: $command"
    exit 1
fi
