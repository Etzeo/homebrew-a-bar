cask "a-bar" do
  version "1.4.2"
  sha256 "0d6b03af8848ec33a66bc38777f7ce0c17cb5bbf75a428a777926962499787ac"

  url "https://github.com/Jean-Tinland/a-bar/releases/download/v#{version}/a-bar.zip",
      verified: "github.com/Jean-Tinland/a-bar/"
  name "a-bar"
  desc "Status bar working on top of yabai and AeroSpace written in Swift"
  homepage "https://github.com/Jean-Tinland/a-bar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "a-bar.app"

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{appdir}/a-bar.app"
  end

  uninstall quit: "com.jeantinland.a-bar"

  zap trash: [
    "~/Library/Application Support/a-bar",
    "~/Library/Caches/com.jeantinland.a-bar",
    "~/Library/Containers/com.jeantinland.a-bar",
    "~/Library/Logs/a-bar",
    "~/Library/Preferences/com.jeantinland.a-bar.plist",
  ]
end
