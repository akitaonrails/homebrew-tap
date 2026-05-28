class Ghpending < Formula
  desc "Watch GitHub repos for open issues and pull requests at a glance"
  homepage "https://github.com/akitaonrails/ghpending"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/akitaonrails/ghpending/releases/download/v#{version}/ghpending-macos-aarch64.tar.gz"
      sha256 "f89d97bad1d8e0e9d43c7eba57c4500c86ddee7c6ed3297e619d139cca1c1ca3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/akitaonrails/ghpending/releases/download/v#{version}/ghpending-linux-x86_64.tar.gz"
      sha256 "525d05acc1b850c3aef270e0e2a17f73bbf5fe1936619899512cd302df0e1cb8"
    end
  end

  def install
    bin.install "ghpending"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghpending --version")
  end
end
