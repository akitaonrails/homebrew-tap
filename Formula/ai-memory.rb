class AiMemory < Formula
  desc "Long-term memory for AI coding agents over MCP and lifecycle hooks"
  homepage "https://aimemory.sh"
  version "3.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-macos-aarch64.tar.gz"
      sha256 "67399327a7b553ca4044efae65526ef8b42aca429ec6c8121714c536021b0911"
    end

    on_intel do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-macos-x86_64.tar.gz"
      sha256 "fcff86e1982137ba87b9076dcc96a1b4e663f5d99bd496b012e78ec7cf65cb37"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-linux-aarch64.tar.gz"
      sha256 "29e9382c4efc12d7a9477c140dffec4f8c647ba7f3a7779a43d82a401924d4fe"
    end

    on_intel do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-linux-x86_64.tar.gz"
      sha256 "67ed4e3ce465de49285e48080103fd1ccabb51936131a4340a68f819667daa9a"
    end
  end

  def install
    libexec.install "ai-memory", "hooks"
    bin.write_exec_script libexec/"ai-memory"
  end

  def caveats
    <<~EOS
      Finish the install with:
        ai-memory setup
      It creates the data dir and its bearer token, installs and starts its
      own LaunchAgent (or systemd user unit), wires the agents it finds, and
      checks the result. It shows the plan and asks first.

      Use either `ai-memory setup` or `brew services start ai-memory`, not
      both. With `brew services`, run `ai-memory init` first, then wire your
      agents with `ai-memory setup --no-service`.
    EOS
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
