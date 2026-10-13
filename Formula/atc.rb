class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "4.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.6.0/atc-darwin-arm64"
      sha256 "5628009df7389bf16447b432c81b176ba15aa1948033183994be623db92aa16a"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.6.0/atc-darwin-x64"
      sha256 "2b97e855a54cd663561babd15aa79b5fb0404b749dfe079d262757f53eb1a419"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.6.0/atc-linux-arm64"
      sha256 "19d1687817b35db3d41ae3748549b3038e56c77bd3eb18597fbe41cd22238985"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.6.0/atc-linux-x64"
      sha256 "1c83d1902ba499ee888eb9685cf3d38377b62cbb99cc5c1637b78b119b7e6fb3"
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
