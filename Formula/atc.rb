class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.9.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.9.2/atc-darwin-arm64"
      sha256 "e89c93be2065cea0058ae1f5914f503d00677c1352be81f83f3fa3ae3c5813e3"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.9.2/atc-darwin-x64"
      sha256 "6e6d1048d34ee9f921d3ab348c49bab5cd8ddd56b9129b456a18695b2840b147"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.9.2/atc-linux-arm64"
      sha256 "3c53fa80b48feff7273aa43adc2f33a59155caf9b430ef81e30ec492a41a5024"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.9.2/atc-linux-x64"
      sha256 "c04cb9cf722a3b8643f0de2b1be9c89006260f60eb89198e86c8ce831398f7ae"
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
