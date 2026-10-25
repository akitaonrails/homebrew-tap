class AiMemory < Formula
  desc "Long-term memory for AI coding agents over MCP and lifecycle hooks"
  homepage "https://aimemory.sh"
  version "3.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-macos-aarch64.tar.gz"
      sha256 "26f365cafc8458cfc4684f18e9b58e18d287623b7fe699445644d92c33215414"
    end

    on_intel do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-macos-x86_64.tar.gz"
      sha256 "e32a1de914e6560eabb181076d7a690d4a5c0049b677c73bebe66ca366e87579"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-linux-aarch64.tar.gz"
      sha256 "0b68b264b9d4e37ae7256b2a3b4ea89ef8c6daa10c4c379d7191d80305b7af46"
    end

    on_intel do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-linux-x86_64.tar.gz"
      sha256 "c87053ce7f498cd3206159c8f7ae4db5e54df8df342a27b2233892fa698a1bf9"
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
