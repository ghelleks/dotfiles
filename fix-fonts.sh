# set up EL repo
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm

# install Nux desktop
rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm

# install the infinality patches
yum --enablerepo=nux-dextop install fontconfig-infinality
yum --enablerepo=nux-dextop install cairo
yum --enablerepo=nux-dextop install libXft
yum --enablerepo=nux-dextop install freetype-infinality

gsettings "set" "org.gnome.settings-daemon.plugins.xsettings" "hinting" "slight"
gsettings "set" "org.gnome.settings-daemon.plugins.xsettings" "antialiasing" "rgba"
echo "Xft.lcdfilter: lcddefault" > ~/.Xresources

