cask "mc-notch" do
  version "1.0.0"
  sha256 "8c57191e5f479e4ad12f96c6379f090d471d270228964cf272f29f0ce5ad9a4c"

  url "https://github.com/ImRLopezAG/mc-notch/releases/download/v#{version}/mc-notch-#{version}.zip",
      verified: "github.com/ImRLopezAG/mc-notch/"

  name "mc-notch"
  desc "Dynamic notch hub for macOS - music, files, tools, calendar"
  homepage "https://github.com/ImRLopezAG/mc-notch"

  depends_on macos: ">= :sonoma"

  app "mc-notch.app"

  zap trash: [
    "~/Library/Preferences/com.mcnotch.app.plist",
    "~/Library/Caches/com.mcnotch.app",
    "~/Library/Application Support/mc-notch",
  ]
end
