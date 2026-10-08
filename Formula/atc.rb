class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.4.2/atc-darwin-arm64"
      sha256 "5625855487dec35039ea8c49a438842e0c53b80c5d6bec213a103785153c7383"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.4.2/atc-darwin-x64"
      sha256 "dbfa11606671e9474c632d15eec06a381c0e1b0d96026adec9dffb16fbb4681f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.4.2/atc-linux-arm64"
      sha256 "ebe224fc93c5829a6481af6c7ef5eebc6dbfd6bdea3a45c7d14ddb311c8640e6"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.4.2/atc-linux-x64"
      sha256 "f6b1a8bf037f442f1d9194203b7adb1f764da5a84351394562b4bf69ac6193b2"
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
