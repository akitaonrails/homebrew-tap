cask "frank-go" do
  version "0.3.15"

  on_arm do
    sha256 "9dc94b9e9cca04af95f74db13ad8d1d6d4e4db14f36e2b45211007e277cb36e8"

    url "https://github.com/akitaonrails/frank_go/releases/download/v#{version}/frank-go-v#{version}-mac-arm64.dmg",
        verified: "github.com/akitaonrails/frank_go/"
  end
  on_intel do
    sha256 "739c4ddb979107ea5df726a4cf171b341a64716622ccb4041ba6e89c40d6fdf0"

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
