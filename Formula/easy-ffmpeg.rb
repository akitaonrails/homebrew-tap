class EasyFfmpeg < Formula
  desc "Smart CLI wrapper around ffmpeg for video conversion and remuxing"
  homepage "https://github.com/akitaonrails/easy-ffmpeg"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/easy-ffmpeg/releases/download/v#{version}/easy-ffmpeg-darwin-arm64",
using: CurlDownloadStrategy
      sha256 "6de77286395e5c7683344b95e261b46d8f107e04ce0cc7ceeb39d561b28a166c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/akitaonrails/easy-ffmpeg/releases/download/v#{version}/easy-ffmpeg-linux-amd64",
using: CurlDownloadStrategy
      sha256 "31461a173c9b8d4d9b2dbeeacb20bb36f1b856b61fd5a35c895d6b140ab79b44"
    end

    on_arm do
      url "https://github.com/akitaonrails/easy-ffmpeg/releases/download/v#{version}/easy-ffmpeg-linux-arm64",
using: CurlDownloadStrategy
      sha256 "2907568302d85197bb929704e0e626a18b90cfb61fe9d59db3bda479cf23649a"
    end
  end

  depends_on "ffmpeg"

  def install
    bin.install Dir.glob("easy-ffmpeg*").first => "easy-ffmpeg"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/easy-ffmpeg --version")
  end
end
