cask 'teamviewer' do
  version '15.5.6'
  sha256 'b52985e8323cafa67cc0e625131dac812adf7b5a7d129881849aee67abfd4136'

  url 'https://download.teamviewer.com/download/TeamViewer.dmg'
  appcast 'https://download.teamviewer.com/download/update/macupdates.xml?id=0&lang=en&version=14.7.1965&os=macos&osversion=10.15.1&type=1&channel=1'
  name 'TeamViewer'
  homepage 'https://www.teamviewer.com/'

  auto_updates true
  conflicts_with cask: 'teamviewer-host'

  pkg 'Install TeamViewer.pkg'

  uninstall delete:    [
                         "#{staged_path}/#{token}", # This Cask should be uninstalled manually.
                         '/Applications/TeamViewer.app',
                       ],
            pkgutil:   'com.teamviewer.teamviewer.*',
            launchctl: [
                         'com.teamviewer.desktop',
                         'com.teamviewer.service',
                         'com.teamviewer.Helper',
                         'com.teamviewer.teamviewer',
                         'com.teamviewer.teamviewer_desktop',
                         'com.teamviewer.teamviewer_service',
                       ],
            quit:      'com.teamviewer.TeamViewer'

  zap trash: [
               '/Library/Preferences/com.teamviewer.teamviewer.preferences.plist',
               '~/Library/Application Support/TeamViewer',
               '~/Library/Caches/com.teamviewer.TeamViewer',
               '~/Library/Cookies/com.teamviewer.TeamViewer.binarycookies',
               '~/Library/Logs/TeamViewer',
               '~/Library/Preferences/com.teamviewer.TeamViewer.plist',
               '~/Library/Preferences/com.teamviewer.teamviewer.preferences.Machine.plist',
               '~/Library/Preferences/com.teamviewer.teamviewer.preferences.plist',
               '~/Library/Saved Application State/com.teamviewer.TeamViewer.savedState',
             ]

  caveats <<~EOS
    WARNING: #{token} has a bug in Catalina where it doesn't deal well with being uninstalled by other utilities.
    The recommended way to remove it is by running their uninstaller under:

       Preferences → Advanced
  EOS
end
