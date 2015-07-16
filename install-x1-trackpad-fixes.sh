
gsettings set org.gnome.settings-daemon.plugins.mouse active false

cat > /etc/X11/xorg.conf.d/00-trackpad.conf <<EOM
# softlink this file into:
# /usr/share/X11/xorg.conf.d
 
# and prevent the settings app from overwriting our settings:
# gsettings set org.gnome.settings-daemon.plugins.mouse active false

# per https://major.io/2013/08/24/get-a-rock-solid-linux-touchpad-configuration-for-the-lenovo-x1-carbon/
 
 
Section "InputClass"
    Identifier "gunnar touchpad catchall"
    MatchIsTouchpad "on"
    MatchDevicePath "/dev/input/event*"
    Driver "synaptics"
 
    # three fingers for the middle button
    Option "TapButton3" "2"
    # drag lock
    Option "LockedDrags" "1"
    # accurate tap-to-click!
    Option "FingerLow" "50"
    Option "FingerHigh" "55"
 
    # prevents too many intentional clicks
    Option "PalmDetect" "0"
 
    # "natural" vertical and horizontal scrolling
    Option "VertTwoFingerScroll" "1"
    Option "VertScrollDelta" "-75"
    Option "HorizTwoFingerScroll" "1"
    Option "HorizScrollDelta" "-75"
 
    Option "MinSpeed" "1"
    Option "MaxSpeed" "1"
 
    Option "AccelerationProfile" "2"
    Option "ConstantDeceleration" "4"
EndSection
EOM
