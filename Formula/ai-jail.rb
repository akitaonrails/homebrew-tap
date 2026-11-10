class AiJail < Formula
  desc "Sandbox wrapper for AI coding agents"
  homepage "https://github.com/akitaonrails/ai-jail"
  version "3.3.1"  # Rendered from verified release artifacts by release.yml.
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/ai-jail/releases/download/v#{version}/ai-jail-macos-aarch64.tar.gz"
      sha256 "df182e182701682162bb188679b928b348fb23782b85d9a6bf7a2a944e0962a7"  # Replaced with the signed archive checksum.
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/akitaonrails/ai-jail/releases/download/v#{version}/ai-jail-linux-x86_64.tar.gz"
      sha256 "0be39963f1e3a1930cfa09ceb9390d44db9df85f7ac4a2813d48c7dcc9cf39a1"  # Replaced with the verified archive checksum.
    end
  end

  def install
    bin.install "ai-jail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ai-jail --version")
  end
end
