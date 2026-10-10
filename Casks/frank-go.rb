cask "frank-go" do
  version "0.3.20"

  on_arm do
    sha256 "719346e16877e1e31f2904476307c7986c88ada2bb7acccded6ecaeb48972fdd"

    url "https://github.com/akitaonrails/frank_go/releases/download/v#{version}/frank-go-v#{version}-mac-arm64.dmg",
        verified: "github.com/akitaonrails/frank_go/"
  end
  on_intel do
    sha256 "5547fde6808f721320b0e4bb7b8888a1dcb75fd208e5d7a1efa3cb558686c7f0"

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
