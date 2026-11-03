class AiMemory < Formula
  desc "Long-term memory for AI coding agents over MCP and lifecycle hooks"
  homepage "https://aimemory.sh"
  version "3.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-macos-aarch64.tar.gz"
      sha256 "29353e4e251fa3738a634961e3aa97f3e7c07c2352945a62dbdbd3580ebe32e5"
    end

    on_intel do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-macos-x86_64.tar.gz"
      sha256 "60f9d8276fe2efda04ba39f62400408338fe1946acdde7c12ddafba53fade155"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-linux-aarch64.tar.gz"
      sha256 "e674592622c5d7669531837c38a2a8ac1069cfa5fc7edc1937d488696e7bc8d9"
    end

    on_intel do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-linux-x86_64.tar.gz"
      sha256 "bb967293da4f977141089a6afeb888d65dc0d12a3a65db9b0c46524324d145a6"
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
