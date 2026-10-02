class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.10.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.10.1/atc-darwin-arm64"
      sha256 "36d7221088c8ae205de3260d0a33b7af53d783170beb4004c6430afb19ee4c31"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.10.1/atc-darwin-x64"
      sha256 "898cc23f597a33e224b804ccf7a5c80f7f0fc343d3be8ba494c9f22ca5378f7f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.10.1/atc-linux-arm64"
      sha256 "50a91554964505f039f44dcd6ed1ce760a1cddadde7569aa638e7f4bf1935d50"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.10.1/atc-linux-x64"
      sha256 "b52e223602e9744383b62e37b61a73ee0b8124334afe649478a03f2d9a98b8dd"
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
