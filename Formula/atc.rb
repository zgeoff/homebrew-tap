class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.3.0/atc-darwin-arm64"
      sha256 "b77e6a7ac72cd031cc6986b454e92584d7aa9d71bdb2f722821bfd22faf99211"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.3.0/atc-darwin-x64"
      sha256 "04baf6100a194b81b9e02f32208d3d4d2cc2f81ec420f66c42250b20a3b99bfb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.3.0/atc-linux-arm64"
      sha256 "8753bc0d2d91b6cd9f92e5f8448654ce7a02c12bc44e33df7e2c24873c1a911e"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.3.0/atc-linux-x64"
      sha256 "e4ec1f389dbb54fa53db3e2c98137c98d587114ead9cb3a3b1661fcb8a5a3c5d"
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
