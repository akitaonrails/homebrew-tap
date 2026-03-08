class EasyFfmpeg < Formula
  desc "Smart CLI wrapper around ffmpeg for video conversion and remuxing"
  homepage "https://github.com/akitaonrails/easy-ffmpeg"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/easy-ffmpeg/releases/download/v#{version}/easy-ffmpeg-darwin-arm64",
using: CurlDownloadStrategy
      sha256 "fe631f21c0e8a7752d43ce9405b7184715c1794527757dfe230d301f22f0e21f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/akitaonrails/easy-ffmpeg/releases/download/v#{version}/easy-ffmpeg-linux-amd64",
using: CurlDownloadStrategy
      sha256 "08649b92715a743218be5e835f782c0afa21d2bc9133624a9fbd01f549b74ae5"
    end

    on_arm do
      url "https://github.com/akitaonrails/easy-ffmpeg/releases/download/v#{version}/easy-ffmpeg-linux-arm64",
using: CurlDownloadStrategy
      sha256 "de7d39780b5a76e0dc9455ed8bb267555f8cb79f45333fdd263677937f1b6e51"
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
