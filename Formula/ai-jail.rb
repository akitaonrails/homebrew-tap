class AiJail < Formula
  desc "Sandbox wrapper for AI coding agents"
  homepage "https://github.com/akitaonrails/ai-jail"
  version "1.3.0"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/ai-jail/releases/download/v#{version}/ai-jail-macos-aarch64.tar.gz"
      sha256 "d5986f57d62c5656adbed55a1e237d3a74a8cb53321c5b43649dea75a352e59b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/akitaonrails/ai-jail/releases/download/v#{version}/ai-jail-linux-x86_64.tar.gz"
      sha256 "8caf3e16283af1c1ba09e02bfcc7ca7603365d54ed6fa77bc1c72338315a26f4"
    end
  end

  def install
    bin.install "ai-jail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ai-jail --version")
  end
end
