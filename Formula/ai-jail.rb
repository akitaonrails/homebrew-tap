class AiJail < Formula
  desc "Sandbox wrapper for AI coding agents"
  homepage "https://github.com/akitaonrails/ai-jail"
  version "1.8.0"
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/ai-jail/releases/download/v#{version}/ai-jail-macos-aarch64.tar.gz"
      sha256 "253d2aabd02ba89458fd1fd90a65bc0e747c59de305c54dfe5fe1f5cdb7adb23"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/akitaonrails/ai-jail/releases/download/v#{version}/ai-jail-linux-x86_64.tar.gz"
      sha256 "a87a49a97b59ee12816f6950819b19cc6e446126f5e5803194bb95eecc03649d"
    end
  end

  def install
    bin.install "ai-jail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ai-jail --version")
  end
end
