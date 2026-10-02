class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.6.0/atc-darwin-arm64"
      sha256 "6c8040c26abf04b9ad97275db06c2af68d6de951d1076c62e505c40c7cf6d422"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.6.0/atc-darwin-x64"
      sha256 "891665bdb4d281792b32c29cabbb8e62d064ed200355e37339a2b0bce08bf655"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.6.0/atc-linux-arm64"
      sha256 "0156becf41663a8b3ee2b152365f58299283e5f59fdfb9bc1815a061d9881c0b"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.6.0/atc-linux-x64"
      sha256 "88879548eba8a9b71165598b72a895057feed0aa76c9ace7be7ff96b700d1b88"
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
