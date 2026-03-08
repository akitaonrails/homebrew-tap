class EasyFfmpeg < Formula
  desc "Smart CLI wrapper around ffmpeg for video conversion and remuxing"
  homepage "https://github.com/akitaonrails/easy-ffmpeg"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/easy-ffmpeg/releases/download/v#{version}/easy-ffmpeg-darwin-arm64",
using: CurlDownloadStrategy
      sha256 "a0742a259ab2793c8b56a0b044588b7827de29dc79055539b6ed748e6cd8b40d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/akitaonrails/easy-ffmpeg/releases/download/v#{version}/easy-ffmpeg-linux-amd64",
using: CurlDownloadStrategy
      sha256 "522144d584608c46267094d9475b18b59c6278638faa767a5363159d33524c1c"
    end

    on_arm do
      url "https://github.com/akitaonrails/easy-ffmpeg/releases/download/v#{version}/easy-ffmpeg-linux-arm64",
using: CurlDownloadStrategy
      sha256 "fc941d9c7b650524e9c0e98ba6e7131348aeb2338c322c2f7750191f47b61f62"
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
