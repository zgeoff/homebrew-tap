class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "4.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.9.0/atc-darwin-arm64"
      sha256 "1c64cee0862d525cd1b8a3b92ce67138dd044bf9fbfbd4cd5fc88fd19d5c1de2"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.9.0/atc-darwin-x64"
      sha256 "d360e00b02ae1f4d36e28bd783ea7b3b22dabe10ac7cef8281f5a67025284351"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.9.0/atc-linux-arm64"
      sha256 "9a41fe67fcedba4f9229dd390115d51140e89a9e71cf547f46951b333053a2db"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.9.0/atc-linux-x64"
      sha256 "8a885bec7e6d529fe6d7824df5c64b01b7795ae08dc3fe7e1d73bd31aec0b97d"
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
