class AiMemory < Formula
  desc "Long-term memory for AI coding agents over MCP and lifecycle hooks"
  homepage "https://github.com/akitaonrails/ai-memory"
  version "2.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-macos-aarch64.tar.gz"
      sha256 "3c23c80b07f7cba0045f13e50e92c98a53fb5f741b50560a67ce3b9739e1bff9"
    end

    on_intel do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-macos-x86_64.tar.gz"
      sha256 "7523b656739ac75989e7a15ac05523fc15112bc915f83cff96e3da90e7c73b5e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-linux-aarch64.tar.gz"
      sha256 "4ae83ba4ea9d67cbf0b177494744828830f2d8a438933c94e6cef036d0203c7e"
    end

    on_intel do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-linux-x86_64.tar.gz"
      sha256 "9b41f75756ddf16a27a3b8ffcdc3a4483fda01b45242f6dbeb51a91745dd686e"
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
