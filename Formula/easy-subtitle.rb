class EasySubtitle < Formula
  desc "Automated subtitle extraction, downloading, and synchronization"
  homepage "https://github.com/akitaonrails/easy-subtitle"
  version "0.5.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/easy-subtitle/releases/download/v#{version}/easy-subtitle-macos-arm64.tar.gz"
      sha256 "0647251c56d823361364a2c3ed8aabb588df719268d8b143ee56cef28e93067a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/akitaonrails/easy-subtitle/releases/download/v#{version}/easy-subtitle-linux-x86_64.tar.gz"
      sha256 "fb0dd393194824a9eb862960d2a9ac98954de96d39e92104ea0c87939c86f2c9"
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
