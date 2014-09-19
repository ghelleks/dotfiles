# Enable kerberos in Chrome, verify in chrome://policy/
defaults write com.google.Chrome AuthServerWhitelist "*.redhat.com"
defaults write com.google.Chrome AuthNegotiateDelegateWhitelist "*.redhat.com"

