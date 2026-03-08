class EasySubtitle < Formula
  desc "Automated subtitle extraction, downloading, and synchronization"
  homepage "https://github.com/akitaonrails/easy-subtitle"
  version "0.3.1"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/easy-subtitle/releases/download/v#{version}/easy-subtitle-macos-arm64.tar.gz"
      sha256 "d6687652d609a215ce127e79bec6a841e32e5b29abe86b428f48813b6aba9483"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/akitaonrails/easy-subtitle/releases/download/v#{version}/easy-subtitle-linux-x86_64.tar.gz"
      sha256 "ca8955f567ed492dd89de5acc9d62069fe6e861828f9fd434c710caa53a5cdb1"
    end
  end

  depends_on "mkvtoolnix"

  def install
    bin.install "easy-subtitle"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/easy-subtitle --version")
  end
end
