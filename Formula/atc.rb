class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.6.0/atc-darwin-arm64"
      sha256 "25f0aa86d4db33b118c3a0b1125b7619dfac45d7c224e9c87bfede836b3cce9f"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.6.0/atc-darwin-x64"
      sha256 "cb2ebf05b58d9e879593c2f14a020618511ac50ac2e9493d2b882d39b9967ce1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.6.0/atc-linux-arm64"
      sha256 "80c4d5eeac72e563fa74f90bcb7761f62404272e964456c3de356936c844a4c9"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.6.0/atc-linux-x64"
      sha256 "5d825c8114b7dcc3457d1988599ed112b5a523ae93003d30d3bbb9525cbff971"
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
