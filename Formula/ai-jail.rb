class AiJail < Formula
  desc "Sandbox wrapper for AI coding agents"
  homepage "https://github.com/akitaonrails/ai-jail"
  version "2.13.1"  # Rendered from verified release artifacts by release.yml.
  license "GPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/ai-jail/releases/download/v#{version}/ai-jail-macos-aarch64.tar.gz"
      sha256 "10d74d4aa58a386a6e93ce2ff2448302fc1555644a00f91a7c081af3084dab1b"  # Replaced with the signed archive checksum.
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/akitaonrails/ai-jail/releases/download/v#{version}/ai-jail-linux-x86_64.tar.gz"
      sha256 "bc9776c644cd9d08ada0cf2a407d27cefc6bf9a5c83ddfa3886d4e3cec74f813"  # Replaced with the verified archive checksum.
    end
  end

  def install
    bin.install "ai-jail"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ai-jail --version")
  end
end
