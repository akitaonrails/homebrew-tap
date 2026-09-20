class Ghpending < Formula
  desc "Watch GitHub repos for open issues and pull requests at a glance"
  homepage "https://github.com/akitaonrails/ghpending"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/ghpending/releases/download/v#{version}/ghpending-macos-aarch64.tar.gz"
      sha256 "00d310586784fe94c44f36bdd2d36fab05c2cf004703e881e1613361e566d8ee"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/akitaonrails/ghpending/releases/download/v#{version}/ghpending-linux-x86_64.tar.gz"
      sha256 "3f68d65ebbc0a4700d0c66e01addb830345da0c5d80dcdbf84b24211dd985d96"
    end
  end

  def install
    bin.install "ghpending"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghpending --version")
  end
end
