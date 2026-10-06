class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.39.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.39.0/atc-darwin-arm64"
      sha256 "bd926ee61cbb2f41c77c58e1ce4ed44df37c97132c2ddc421bf810fc2c7fac6a"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.39.0/atc-darwin-x64"
      sha256 "2ca07756a5e6c56267a018f21c135667b6d237a6421d736713b8b2b60d9df29a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.39.0/atc-linux-arm64"
      sha256 "8f894ed2d38174920e4097bdbfd4aba82892232cb9ffdda59df305b7ba8a4818"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.39.0/atc-linux-x64"
      sha256 "5bce611ea0e48fcb25d1642a89a8fbb9ab4ad66889f8de3553db9c56fe92ae83"
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
