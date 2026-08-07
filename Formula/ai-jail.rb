class AiJail < Formula
  desc "Sandbox wrapper for AI coding agents"
  homepage "https://github.com/akitaonrails/ai-jail"
  version "1.16.1"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/ai-jail/releases/download/v#{version}/ai-jail-macos-aarch64.tar.gz"
      sha256 "102e3a3b4eb9432f94b329e11ef0877eeb0c3fa22294958e9eea9c483b88abec"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/akitaonrails/ai-jail/releases/download/v#{version}/ai-jail-linux-x86_64.tar.gz"
      sha256 "b47dc13def8b76ccbcb17819ee13914d1bf9d5918e56c9618bf2d73f36c79e01"
    end
  end

  def install
    bin.install "ai-jail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ai-jail --version")
  end
end
