class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.8.1/atc-darwin-arm64"
      sha256 "7a6d070664acab159852d0cd35b0fae62bb588a4518f96a14e1ad42db6ca0050"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.8.1/atc-darwin-x64"
      sha256 "ccef0a66f57e44075d08a1677ae655514dcfd7b3359a1dc2ff0f21d3d7ce4c44"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.8.1/atc-linux-arm64"
      sha256 "b5ee2c2ace7cd0113d2b2805ced09c80d0e9cc7c19b122db1a3c687d8fd20415"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.8.1/atc-linux-x64"
      sha256 "2261cbc4acff3d5336231c40d04637e5e5b3d61b421493034682f158a0ad732c"
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
