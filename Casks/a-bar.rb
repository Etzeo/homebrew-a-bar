cask "a-bar" do
  version "1.3.8"
  sha256 "dd552147934a5becc7b77ba3beeae31341d996d49b0b781e5927573a9131d612"

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
