class AiJail < Formula
  desc "Sandbox wrapper for AI coding agents"
  homepage "https://github.com/akitaonrails/ai-jail"
  version "1.4.3"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/ai-jail/releases/download/v#{version}/ai-jail-macos-aarch64.tar.gz"
      sha256 "ef431e740664454c3c5f99329355c8c6a9f8ff25791f4abe8cd4194a01f81fba"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/akitaonrails/ai-jail/releases/download/v#{version}/ai-jail-linux-x86_64.tar.gz"
      sha256 "425384fbad372eefb38f1124fc5670bd197d628dfff6f5cc1c606c4f8214e8ee"
    end
  end

  def install
    bin.install "ai-jail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ai-jail --version")
  end
end
