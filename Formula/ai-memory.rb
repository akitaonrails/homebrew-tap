class AiMemory < Formula
  desc "Long-term memory for AI coding agents over MCP and lifecycle hooks"
  homepage "https://github.com/akitaonrails/ai-memory"
  version "2.6.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-macos-aarch64.tar.gz"
      sha256 "3162a52f632ffaab089c6fc78d7c97a0a5ab0fb51b242a48f245a106546c9cb7"
    end

    on_intel do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-macos-x86_64.tar.gz"
      sha256 "9ff7a95492fc3edc6ec3ee01b8a0b94f01aebbed018919741354b8076c4e23d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-linux-aarch64.tar.gz"
      sha256 "6379c99274cdbbe884ec36431ba002a7a1afd0fa1bcf221106e6a0190e246103"
    end

    on_intel do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-linux-x86_64.tar.gz"
      sha256 "b0de4f2002be388170aa81a91252832aa5d234b3511196806d0ca1708de75353"
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
