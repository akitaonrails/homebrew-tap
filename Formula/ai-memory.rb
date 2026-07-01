class AiMemory < Formula
  desc "Long-term memory for AI coding agents over MCP and lifecycle hooks"
  homepage "https://github.com/akitaonrails/ai-memory"
  version "1.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-macos-aarch64.tar.gz"
      sha256 "57d180c36ed9a1d7b995f2b6a03b0069139e87fb71e2c8e5dfceb391c8a4c723"
    end

    on_intel do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-macos-x86_64.tar.gz"
      sha256 "c4c834edca0c74048daa76b7e626033c99512f5cd94afa2ac00136c248286ffa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-linux-aarch64.tar.gz"
      sha256 "4f46d341afa8b410fae93b360f11ff2b26722966c770cb44301d4fe1732cce2f"
    end

    on_intel do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-linux-x86_64.tar.gz"
      sha256 "7c5145afffc9e75f8d9c4c0e7eaa602aaef8746ee1113844fa9389fffa69caf2"
    end
  end

  def install
    libexec.install "ai-memory", "hooks"
    bin.write_exec_script libexec/"ai-memory"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ai-memory --version")
  end
end
