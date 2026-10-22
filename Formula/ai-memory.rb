class AiMemory < Formula
  desc "Long-term memory for AI coding agents over MCP and lifecycle hooks"
  homepage "https://aimemory.sh"
  version "3.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-macos-aarch64.tar.gz"
      sha256 "2fefb3ec5c46a6d94bb0005081d12b3f4ecff3c6808f0bebab0f92dd7e5fb01f"
    end

    on_intel do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-macos-x86_64.tar.gz"
      sha256 "8e325c92d8551eeadd519cbf76e944e8907d569ce137a9652aa467257593716b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-linux-aarch64.tar.gz"
      sha256 "7df8dc899829be221b70eb1bdfbec3ac09dd0ec8099fd6683dae00104cbdbddb"
    end

    on_intel do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-linux-x86_64.tar.gz"
      sha256 "37e5acbb40f1b7d828a5279b4a2f0305adcb8b811b090b3a0fd5d7e77eef180a"
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
