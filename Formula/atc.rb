class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.3.1/atc-darwin-arm64"
      sha256 "8e95041ce997daaf7ddacd495da19f2a8e5e171cc1183c78509ccc0a043ccc24"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.3.1/atc-darwin-x64"
      sha256 "02ac856980987d98cf415919982d370c38fd5be6bed21861a6db7da8e8fb59a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.3.1/atc-linux-arm64"
      sha256 "71c6c6e855a50e04a3c8df4c1cb8f401f5748d32b3121e349c87d13aae30a64b"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.3.1/atc-linux-x64"
      sha256 "9ca1c9f59fc1ba68004b6ba2d52714d6afad80322db69e39eda8b2b2c0d3f484"
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
