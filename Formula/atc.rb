class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.12.0/atc-darwin-arm64"
      sha256 "159e0ae1b3cdb11cd7c030d17de7f5f03f9633b44398be084430038727dfe042"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.12.0/atc-darwin-x64"
      sha256 "aa8de6d9a9a9c5abf9ca839f8238e745887cfdaddf0b9e55534eda3d61884b41"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.12.0/atc-linux-arm64"
      sha256 "643825ceaf538c94493a34c298d2cc2a7a9a2803457680328fd733c88953ad00"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.12.0/atc-linux-x64"
      sha256 "1f7e20f908c6c0e696322fd74d587e42d03847ed3bc54d4aba367757f5febea6"
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
