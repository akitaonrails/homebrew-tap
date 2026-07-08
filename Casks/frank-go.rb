cask "frank-go" do
  version "0.3.8"

  on_arm do
    sha256 "2ff1b3c644de9d4a0b0fdc71e1764076e7528866cc62fb6776b5845443bdf655"

    url "https://github.com/akitaonrails/frank_go/releases/download/v#{version}/frank-go-v#{version}-mac-arm64.dmg",
        verified: "github.com/akitaonrails/frank_go/"
  end
  on_intel do
    sha256 "173d1c2501637a08b3a6c3625d767a4376449ae8610232b56cf2ebc4adc7047a"

    url "https://github.com/akitaonrails/frank_go/releases/download/v#{version}/frank-go-v#{version}-mac-x64.dmg",
        verified: "github.com/akitaonrails/frank_go/"
  end

  name "Frank GO"
  desc "Friendly, offline Go (Baduk/Weiqi) trainer for beginners"
  homepage "https://github.com/akitaonrails/frank_go"

  app "Frank GO.app"

  caveats <<~EOS
    The play-vs-AI and guess-review features need KataGo, which has no official
    macOS binary. Install it with:
      brew install katago
    Everything else (tsumego, study, drills, area painting) works without it.
  EOS

  zap trash: [
    "~/Library/Application Support/Frank GO",
    "~/Library/Preferences/com.akitaonrails.frank-go.plist",
    "~/Library/Saved Application State/com.akitaonrails.frank-go.savedState",
  ]
end
