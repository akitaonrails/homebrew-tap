class AiJail < Formula
  desc "Sandbox wrapper for AI coding agents"
  homepage "https://github.com/akitaonrails/ai-jail"
  version "2.4.1"  # Rendered from verified release artifacts by release.yml.
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/ai-jail/releases/download/v#{version}/ai-jail-macos-aarch64.tar.gz"
      sha256 "830786910c42e064c28c678e965d64cf0595f903a7981f4ebe52eb272ea5b3c1"  # Replaced with the signed archive checksum.
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/akitaonrails/ai-jail/releases/download/v#{version}/ai-jail-linux-x86_64.tar.gz"
      sha256 "36d3cc0777a014e6227f31ff9274906ab48ef2f5861775ba9f7452b86b751540"  # Replaced with the verified archive checksum.
    end
  end

  def install
    bin.install "ai-jail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ai-jail --version")
  end
end
