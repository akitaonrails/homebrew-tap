class AiMemory < Formula
  desc "Long-term memory for AI coding agents over MCP and lifecycle hooks"
  homepage "https://aimemory.sh"
  version "2.6.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-macos-aarch64.tar.gz"
      sha256 "bb1a729cb1559e93aa6d7947d52296b962c362272b50f697eaf11cda451ea9f4"
    end

    on_intel do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-macos-x86_64.tar.gz"
      sha256 "1d19aa9ca0853aca4cd9592db942032086c00345254039c6571d6539a4bda323"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-linux-aarch64.tar.gz"
      sha256 "801b8af3d23b0463e511a883b121969b30ad33c324ed29c7ec59e73a351eab5a"
    end

    on_intel do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-linux-x86_64.tar.gz"
      sha256 "f38859a610b0582d045418f8cef0787143fe47477783f8e168f68397a8b897c5"
    end
  end

  def install
    libexec.install "ai-memory", "hooks"
    bin.write_exec_script libexec/"ai-memory"
  end

  service do
    run [opt_bin/"ai-memory", "serve", "--transport", "http", "--enable-web"]
    keep_alive true
    process_type :interactive
    log_path var/"log/ai-memory.log"
    error_log_path var/"log/ai-memory.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ai-memory --version")
  end
end
