class AiJail < Formula
  desc "Sandbox wrapper for AI coding agents"
  homepage "https://github.com/akitaonrails/ai-jail"
  version "2.6.2"  # Rendered from verified release artifacts by release.yml.
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/ai-jail/releases/download/v#{version}/ai-jail-macos-aarch64.tar.gz"
      sha256 "59fca1a95db912d41b5a1ac3e0055f82850f92b046d799626ce2480413a9bfa6"  # Replaced with the signed archive checksum.
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/akitaonrails/ai-jail/releases/download/v#{version}/ai-jail-linux-x86_64.tar.gz"
      sha256 "541ea6a743f710fcc7fd6bbd7542f619f8911d149616dec2dbabcba8ddbb9f00"  # Replaced with the verified archive checksum.
    end
  end

  def install
    bin.install "ai-jail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ai-jail --version")
  end
end
