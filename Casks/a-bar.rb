cask "a-bar" do
  version "1.3.4"
  sha256 "0b93904365aa460b9e0a0e05ecae97cbec6a420cdb9d3ea80c4a9a97391e31e1"

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
