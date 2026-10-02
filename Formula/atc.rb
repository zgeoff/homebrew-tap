class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.5.1/atc-darwin-arm64"
      sha256 "1d376383362f01e9ee13e00f903d67bf37f228fcb264b9921a33d214730b801f"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.5.1/atc-darwin-x64"
      sha256 "b8611fb1b4b5e16ec34758dd3199aa8685195b44a8054e069975162cfe6557c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.5.1/atc-linux-arm64"
      sha256 "f2b9424f7647f742f3fd2ebe4ca00bda40d2b53e849bde107d7255bedf8d5112"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.5.1/atc-linux-x64"
      sha256 "b317db4f95914d0df279b295d51e8e8aa29a528abb72f560a469c99396d057c4"
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
