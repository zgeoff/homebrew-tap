class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.26.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.6/atc-darwin-arm64"
      sha256 "9664ef5c6f7dffa3c0782426d48ec2b2d7072481d29f28465f487a223e81668b"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.6/atc-darwin-x64"
      sha256 "a4fdc83b6247ddbe94a32cb8e5a54f09e64fe95bca80f52bf7f0202b1aa2bddc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.6/atc-linux-arm64"
      sha256 "6d3499771dee2e42d0540488f261b08d5319fc09e555e470d33be2eb31d105fb"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.6/atc-linux-x64"
      sha256 "53b242df0becb4603e61efad689d74cde6741f2db2462dfbc7fa90ce728297cf"
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
