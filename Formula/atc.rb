class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.27.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.27.1/atc-darwin-arm64"
      sha256 "895909734a94387531d1e158554f4a9d14fd7e45ac8f8f7a1ba26f17e00c2b85"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.27.1/atc-darwin-x64"
      sha256 "a3debbf5623b9cc92d6622f3178a5b8d96ec8cfef7d13a01b7357c3e7ae67174"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.27.1/atc-linux-arm64"
      sha256 "67c1d22921daf2cb911dd7a82aae8b56da94277f2790aab0cf62c75fdc191666"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.27.1/atc-linux-x64"
      sha256 "89650c9eae92cc011a721411f91eeb6bf698a822250d0dbe929798fed72eab3b"
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
