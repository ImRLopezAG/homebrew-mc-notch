cask "mc-notch" do
  version "1.0.0"
  sha256 "858358d7f1b61594b941f66ff3ac9dd5c0bc2df20af46028fc9d1632bfa72745"

  url "https://github.com/ImRLopezAG/mc-notch/releases/download/v#{version}/mc-notch-#{version}.zip",
      verified: "github.com/ImRLopezAG/mc-notch/"

  name "mc-notch"
  desc "Dynamic notch hub for macOS - music, files, tools, calendar"
  homepage "https://github.com/ImRLopezAG/mc-notch"

  depends_on macos: ">= :sonoma"

  app "mc-notch.app"

  # Remove quarantine to avoid Gatekeeper warning (app is not notarized)
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/mc-notch.app"]
  end

  caveats <<~EOS
    mc-notch is not notarized by Apple.
    If you see a security warning, the postflight script should have fixed it.
    If not, run: xattr -cr /Applications/mc-notch.app
  EOS

  zap trash: [
    "~/Library/Preferences/com.mcnotch.app.plist",
    "~/Library/Caches/com.mcnotch.app",
    "~/Library/Application Support/mc-notch",
  ]
end
