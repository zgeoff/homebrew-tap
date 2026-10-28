class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.5.0/atc-darwin-arm64"
      sha256 "c2c5047e82f7e85c4e1972076111913ec0942af9d3d28fc19a34241e8ac06686"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.5.0/atc-darwin-x64"
      sha256 "263ab14db3a6d958b0c486adc74a580e6167b911badfc95e72fb84629c7bf89f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.5.0/atc-linux-arm64"
      sha256 "0b871a94ca4616eeac40b231a1701b0cdee030c064bbba8fb9fb721e7acd4cb4"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.5.0/atc-linux-x64"
      sha256 "f4415b7b04d526db1a21b1bce0d23b277c5deb4e4ba393eb97324209674426ac"
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
