class Ghpending < Formula
  desc "Watch GitHub repos for open issues and pull requests at a glance"
  homepage "https://github.com/akitaonrails/ghpending"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/ghpending/releases/download/v#{version}/ghpending-macos-aarch64.tar.gz"
      sha256 "cc064e5a0edb01cd6371c58d21a67b3bc74b3b8565d56c52dd9a31b76bfe951e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/akitaonrails/ghpending/releases/download/v#{version}/ghpending-linux-x86_64.tar.gz"
      sha256 "b065759a6d53b1e8c37c2c5f2251807525aaa6a03147044caafce56d0d80f4c0"
    end
  end

  def install
    bin.install "ghpending"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghpending --version")
  end
end
