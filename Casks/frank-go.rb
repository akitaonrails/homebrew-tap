cask "frank-go" do
  version "0.3.13"

  on_arm do
    sha256 "b72eada3064d8dd361604d81514c959c01f2612b0274e99070d75c2b4afd7848"

    url "https://github.com/akitaonrails/frank_go/releases/download/v#{version}/frank-go-v#{version}-mac-arm64.dmg",
        verified: "github.com/akitaonrails/frank_go/"
  end
  on_intel do
    sha256 "62ae6642109b20db360bc0de671669da882050ee5dfcd323a328475adafb4219"

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
