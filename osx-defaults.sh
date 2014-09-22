# Enable kerberos in Chrome, verify in chrome://policy/
defaults write com.google.Chrome AuthServerWhitelist "*.redhat.com"
defaults write com.google.Chrome AuthNegotiateDelegateWhitelist "*.redhat.com"

# View Mail.app emails in plain text, like god intended
defaults write com.apple.mail PreferPlainText -bool true

