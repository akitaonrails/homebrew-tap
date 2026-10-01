class AiJail < Formula
  desc "Sandbox wrapper for AI coding agents"
  homepage "https://github.com/akitaonrails/ai-jail"
  version "2.5.0"  # Rendered from verified release artifacts by release.yml.
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/ai-jail/releases/download/v#{version}/ai-jail-macos-aarch64.tar.gz"
      sha256 "9dfa16a3a887f780f8b12994017c3d85f2384ad082082b8db9cc63ba7c467ee1"  # Replaced with the signed archive checksum.
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/akitaonrails/ai-jail/releases/download/v#{version}/ai-jail-linux-x86_64.tar.gz"
      sha256 "0735197a80f211d147d04c08c07ff139b9906d36b8d0137c974c2e8fa90a2d15"  # Replaced with the verified archive checksum.
    end
  end

  def install
    bin.install "ai-jail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ai-jail --version")
  end
end
