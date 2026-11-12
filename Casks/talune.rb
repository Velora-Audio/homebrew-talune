cask "talune" do
  version "1.0.0"
  sha256 "fe8fbd373b7f1a928fb9345a753a164d1300b5bcf07a44ba12b9a046cb157021"

  url "https://github.com/Velora-Audio/homebrew-talune/releases/download/v#{version}/Talune_#{version}_aarch64.dmg"
  name "Talune"
  desc "Desktop client for Talune"
  homepage "https://github.com/Velora-Audio/talune-client"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Talune.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Talune.app"],
        must_succeed: false
  end

  uninstall quit: "com.talune.client"

  zap trash: [
    "~/Library/Application Support/com.talune.client",
    "~/Library/Caches/com.talune.client",
    "~/Library/HTTPStorages/com.talune.client",
    "~/Library/Preferences/com.talune.client.plist",
    "~/Library/Saved Application State/com.talune.client.savedState",
    "~/Library/WebKit/com.talune.client",
  ]
end
