class EasySubtitle < Formula
  desc "Automated subtitle extraction, downloading, and synchronization"
  homepage "https://github.com/akitaonrails/easy-subtitle"
  version "0.5.1"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/easy-subtitle/releases/download/v#{version}/easy-subtitle-macos-arm64.tar.gz"
      sha256 "70ddfa40320b4572e9a1da656e73ab1762e236bb17f0a820fe352952a292b547"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/akitaonrails/easy-subtitle/releases/download/v#{version}/easy-subtitle-linux-x86_64.tar.gz"
      sha256 "2237e6852605f4957150160cad759968988b69194e7eb39e4f1372bb6074a7a1"
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
