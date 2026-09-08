class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.3.0/atc-darwin-arm64"
      sha256 "c47cfdfa73898061ae1d50c383beea7f362f03764877c42642a15e3e192ddff5"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.3.0/atc-darwin-x64"
      sha256 "757f232ea66fa10b38212597f9a736b07d5da13b5294d4ccaef9915cc5e59286"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.3.0/atc-linux-arm64"
      sha256 "cecc94eb42f1302a68306967d187ec7178ef1268322acc5f984edbebadac3bc3"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.3.0/atc-linux-x64"
      sha256 "6dcdb6790b4937f0b0b0a1554a2a5416615368296a5df8721edc809a503d331d"
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
