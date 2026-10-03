class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.16.0/atc-darwin-arm64"
      sha256 "7cd6e764ef6343b1250f2c413f96088dd9ff90425776fc703643d923bacb7909"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.16.0/atc-darwin-x64"
      sha256 "42a50dfbcbd4a63e14bd056ff4f01c10dcaf2175270f55c297d3eb81a83d147d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.16.0/atc-linux-arm64"
      sha256 "7ba358565459a326b3f4bc407be7dfbd3f298399f15f182bab61ada344beb931"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.16.0/atc-linux-x64"
      sha256 "708e827ddb47e0dd62b92a799c0eebe4ca2345783156267947ba17d35b4ce945"
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
