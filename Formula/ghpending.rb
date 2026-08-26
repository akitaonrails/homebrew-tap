class Ghpending < Formula
  desc "Watch GitHub repos for open issues and pull requests at a glance"
  homepage "https://github.com/akitaonrails/ghpending"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/ghpending/releases/download/v#{version}/ghpending-macos-aarch64.tar.gz"
      sha256 "707040aa179956d1d45d7f97c6bdeabd4fe0023ef8a8eaa9f9bcd2e871546a89"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/akitaonrails/ghpending/releases/download/v#{version}/ghpending-linux-x86_64.tar.gz"
      sha256 "568188891ed2fccfacffaaebd742ad0b2e60f488e7741c33c86b49520ba4c9b0"
    end
  end

  def install
    bin.install "ghpending"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghpending --version")
  end
end
