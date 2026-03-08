class EasyFfmpeg < Formula
  desc "Smart CLI wrapper around ffmpeg for video conversion and remuxing"
  homepage "https://github.com/akitaonrails/easy-ffmpeg"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/easy-ffmpeg/releases/download/v#{version}/easy-ffmpeg-darwin-arm64",
          using: CurlDownloadStrategy
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/akitaonrails/easy-ffmpeg/releases/download/v#{version}/easy-ffmpeg-linux-amd64",
          using: CurlDownloadStrategy
      sha256 "PLACEHOLDER"
    end

    on_arm do
      url "https://github.com/akitaonrails/easy-ffmpeg/releases/download/v#{version}/easy-ffmpeg-linux-arm64",
          using: CurlDownloadStrategy
      sha256 "PLACEHOLDER"
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
