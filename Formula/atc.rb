class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "4.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.5.0/atc-darwin-arm64"
      sha256 "8ad45990adbf02c23012bfdee8007aad41e7f413a82168f7cc74ec7ac2d0b1b1"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.5.0/atc-darwin-x64"
      sha256 "9501e8bba9a5b61af2c0388d859752ee715e19309d682c6f91259dbdac815d9c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.5.0/atc-linux-arm64"
      sha256 "6f5ed2fb819fcd7e29bd730b406d6666098dd8ef1a09eeca9037b52513fa42da"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.5.0/atc-linux-x64"
      sha256 "444bc9c68890decab4766591b623cb55027d6895a803ac035e130041822548e9"
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
