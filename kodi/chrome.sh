destination="/sdcard/Android/data/org.xbmc.kodi/files/.kodi/userdata/playercorefactory.xml"
command=$1
kodiuser=u0_a306
kodigroup=sdcard_rw

if [ "$command" == "update" ]
then
    cat << EOF > "$destination"
<playercorefactory>
    <players>
        <player name="LocalCast" type="ExternalPlayer" audio="false" video="true">
            <filename>de.stefanpledl.localcast</filename>
            <hidexbmc>true</hidexbmc>
            <playcountminimumtime>120</playcountminimumtime>
        </player>
    </players>
    <rules action="prepend">
        <rule protocols="smb" player="LocalCast" />
        <rule dvdimage="true" player="LocalCast" />
        <rule protocols="rtmp" player="LocalCast" />
        <rule protocols="rtsp" player="LocalCast" />
        <rule protocols="sop" player="LocalCast" />
        <rule internetstream="true" player="LocalCast" />
        <rule video="true" player="LocalCast" /> <!-- Default for anything else not listed -->
    </rules>
</playercorefactory>
EOF
    chown -R $kodiuser:$kodigroup "$destination"
    echo 'kodi -> chrome'
elif [ "$command" == "remove" ]
then
     rm "$destination"
     echo 'kodi -> kodi'
else
    echo "invalid command: $command"
    exit 1
fi
