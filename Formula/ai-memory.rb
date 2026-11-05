class AiMemory < Formula
  desc "Long-term memory for AI coding agents over MCP and lifecycle hooks"
  homepage "https://aimemory.sh"
  version "3.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-macos-aarch64.tar.gz"
      sha256 "afefdfa7bac1dcbb9d4358f812825bba823470831a3e72ba804e9de5fada159b"
    end

    on_intel do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-macos-x86_64.tar.gz"
      sha256 "93f7c5d644e6de539e2ec9efb65c9596fda95b3f9470cab20645e4c7e673214a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-linux-aarch64.tar.gz"
      sha256 "164f7c38bb9bafca218dd958c3c60febcd5d2f5200ad138c6f128576cedebfb6"
    end

    on_intel do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-linux-x86_64.tar.gz"
      sha256 "15a4f4a346a27e6fd63a36d1b3de23c5cbe142b80b3bce561e21b1f225a1e645"
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
