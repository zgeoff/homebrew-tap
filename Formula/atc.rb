class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.30.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.30.0/atc-darwin-arm64"
      sha256 "550a7b1f66ed1af0ca653d958b9e30c3e3139fbd817b28437942e53b5422918b"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.30.0/atc-darwin-x64"
      sha256 "31289db0ed23b750e5dd8edad28f8d491689d4191d2f1d2f9f6bcf2699790e77"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.30.0/atc-linux-arm64"
      sha256 "2dbd8691f0b006a31db8ff30dc72bee4a8a791f29b655b66261c1580d5a0bf67"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.30.0/atc-linux-x64"
      sha256 "c6989fa029a5b68a1ab95d17d78a1685f3af433da8c8a34a461ec86cbfef66bc"
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
