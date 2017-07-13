cask 'xld' do
  version '2017.07.10'
  sha256 '4703f2326a1937625991214e9fde56239322cfe02e151f9e054c52b4438680c0'

  # sourceforge.net/xld was verified as official when first introduced to the cask
  url "https://downloads.sourceforge.net/xld/xld-#{version.no_dots}.dmg"
  appcast 'https://svn.code.sf.net/p/xld/code/appcast/xld-appcast_e.xml',
          checkpoint: 'a4ee16852253d2510498c9ba658fa18e3eba379eb1ee359ea33f25d16d65a0c8'
  name 'X Lossless Decoder'
  name 'XLD'
  homepage 'http://tmkk.undo.jp/xld/index_e.html'

  app 'XLD.app'

  zap delete: [
                '~/Library/Application Support/XLD',
                '~/Library/Preferences/jp.tmkk.XLD.plist',
                '~/Library/Caches/jp.tmkk.XLD',
                '~/Library/Saved Application State/jp.tmkk.XLD.savedState',
              ]
end
