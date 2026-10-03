class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.15.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.15.1/atc-darwin-arm64"
      sha256 "83bc0554d86bacf45257dcde1c0f225d48695487f95782e84da63dc7bf2674f8"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.15.1/atc-darwin-x64"
      sha256 "efe1458166e23a47aeff2cecf6729669b21229a767c39c67b18f85cc9f11bf8e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.15.1/atc-linux-arm64"
      sha256 "165c7a21baf8a11ced34afa5926433b67a9f03b0c7cae8075b6558146fdef115"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.15.1/atc-linux-x64"
      sha256 "360ce801067dfb8cc9e84a05cccf859b8e955c057b71c9b852dba0e07ce4eac4"
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
