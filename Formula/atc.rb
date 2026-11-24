class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.26.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.26.0/atc-darwin-arm64"
      sha256 "dc019ef6caee30d8756c0fcdbd7fccce0e21cafbe846288cdf5968e9e194cbfa"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.26.0/atc-darwin-x64"
      sha256 "179eee2dfa53e4c8e1da4bb777252773958dc42dea3e596051ab2751135d7ef0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.26.0/atc-linux-arm64"
      sha256 "1501fc3571ddae591f802612d768f9792596000d05fddbf98289a547c810a9b3"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.26.0/atc-linux-x64"
      sha256 "5def62601baa108371d0febd089db8d38837b1ab9aa8196a29d6390e76784468"
    end
  end

  def install
    binary = Dir["atc-*"].first
    bin.install binary => "atc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/atc --version")
  end
end
