cask "talune" do
  version "1.1.0"
  sha256 "37a347e2b6ed809c31c0390bda4a5e757cf683a8af3bc0d7b1f282d3ff0b7da6"

  url "https://github.com/Velora-Audio/talune-app/releases/download/v#{version}/Talune_#{version}_universal.dmg"
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
