class EasySubtitle < Formula
  desc "Automated subtitle extraction, downloading, and synchronization"
  homepage "https://github.com/akitaonrails/easy-subtitle"
  version "0.5.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/easy-subtitle/releases/download/v#{version}/easy-subtitle-macos-arm64.tar.gz"
      sha256 "ac01a8a39a824a55b0f604ff0fe30c71d54992d57e7399d1c065968cba3b3162"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/akitaonrails/easy-subtitle/releases/download/v#{version}/easy-subtitle-linux-x86_64.tar.gz"
      sha256 "76230ca3b1dfafb5882ee576c4b21ce79e532b7ba01e55f1e1c70b71ed434c32"
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
