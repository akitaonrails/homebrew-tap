class EasySubtitle < Formula
  desc "Automated subtitle extraction, downloading, and synchronization"
  homepage "https://github.com/akitaonrails/easy-subtitle"
  version "0.4.1"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/easy-subtitle/releases/download/v#{version}/easy-subtitle-macos-arm64.tar.gz"
      sha256 "db652006309676b7661bf4d7b09098bc504b0c347bd5111fdcafaba10120b0fa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/akitaonrails/easy-subtitle/releases/download/v#{version}/easy-subtitle-linux-x86_64.tar.gz"
      sha256 "47a9a078f67a2391264ea1cb2338d1908897e57dfed94ca8ba02b36cc8f835ae"
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
