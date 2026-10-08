class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.5.0/atc-darwin-arm64"
      sha256 "a64e692c75831ab0ad4fbfbfff9c2fa5413a55c9b877adbdca14a778dc1d1aa7"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.5.0/atc-darwin-x64"
      sha256 "ae71ec393e5153fe224cb9cbc316649a6a9fd9c94e5ff9d2ecc343f3c6152ec2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.5.0/atc-linux-arm64"
      sha256 "fa6f9b10f6560916226275bfb8a59d8eee3d7f5709f9c4a1260e8e7dc76cca83"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.5.0/atc-linux-x64"
      sha256 "197e743aa65be9aae6f7bbee185638efae232b5634a9ff0abce1777c36b381f6"
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
