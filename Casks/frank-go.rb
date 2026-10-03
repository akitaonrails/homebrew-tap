cask "frank-go" do
  version "0.3.19"

  on_arm do
    sha256 "5549d7959ddf070cbb82b1fe2e99c82d4287c555b5ae599887feffefd49cf319"

    url "https://github.com/akitaonrails/frank_go/releases/download/v#{version}/frank-go-v#{version}-mac-arm64.dmg",
        verified: "github.com/akitaonrails/frank_go/"
  end
  on_intel do
    sha256 "16b2aa6441274d7247dda763a7360b3b5d63c6e91e457ab6d4aa2efc7f9a910b"

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
