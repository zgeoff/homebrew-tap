class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "4.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.11.0/atc-darwin-arm64"
      sha256 "60a8f7507f4763de682fc581e5fc32e227ff99fafa3d67cf92d7163a75430ebc"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.11.0/atc-darwin-x64"
      sha256 "c0ade30b407933603a0616cabe4f29594e39a3ae67c096e4a26b38d0b24420d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.11.0/atc-linux-arm64"
      sha256 "c8e44d502f68d1ab9092c75bcec52d6d90e98a33f5153bf4a7e9e110fc89d8d4"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.11.0/atc-linux-x64"
      sha256 "bcb6dd867fa46b1ce96d7ec85e0f501690c25d8b22d330153a89f48135e8aaba"
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
