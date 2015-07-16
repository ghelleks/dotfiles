sudo yum install freetype-freeworld
gsettings "set" "org.gnome.settings-daemon.plugins.xsettings" "hinting" "slight"
gsettings "set" "org.gnome.settings-daemon.plugins.xsettings" "antialiasing" "rgba"
echo "Xft.lcdfilter: lcddefault" > ~/.Xresources

