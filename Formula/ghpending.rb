class Ghpending < Formula
  desc "Watch GitHub repos for open issues and pull requests at a glance"
  homepage "https://github.com/akitaonrails/ghpending"
  version "0.3.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/ghpending/releases/download/v#{version}/ghpending-macos-aarch64.tar.gz"
      sha256 "27c6f94dc49b5777417e0554624e6797ae4abb4bbabfdba3c3af0ec1fd0964c8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/akitaonrails/ghpending/releases/download/v#{version}/ghpending-linux-x86_64.tar.gz"
      sha256 "2ba3ee8fe5117e356571aa11c9e41c5087dd53c924afd2676a4c005a49e8e75f"
    end
  end

  def install
    bin.install "ghpending"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghpending --version")
  end
end
