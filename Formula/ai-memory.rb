class AiMemory < Formula
  desc "Long-term memory for AI coding agents over MCP and lifecycle hooks"
  homepage "https://github.com/akitaonrails/ai-memory"
  version "2.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-macos-aarch64.tar.gz"
      sha256 "0c1b820d08ca647a7f5e05cb1fd35e1d745b4166e39bb9e066af7810f8eacb42"
    end

    on_intel do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-macos-x86_64.tar.gz"
      sha256 "9c7a53c351f73884a1a15c6dd38d885db36606b64cbd21d699416de9dffa526e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-linux-aarch64.tar.gz"
      sha256 "f5fbe2ba7f21469cb473c6cdfc74d62c01eaaaea1b792e3a0251953169589bfd"
    end

    on_intel do
      url "https://github.com/akitaonrails/ai-memory/releases/download/v#{version}/ai-memory-linux-x86_64.tar.gz"
      sha256 "15cafdc48eabc0305c164ccc8e884b260275f5a88b4f26e8456c2e42156375e4"
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
