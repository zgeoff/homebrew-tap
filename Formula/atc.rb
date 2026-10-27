class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.4.0/atc-darwin-arm64"
      sha256 "1dc33d1494c7e2f98ed38370383986663715539a0261e96366dd4e0afcc69bf9"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.4.0/atc-darwin-x64"
      sha256 "cb06ff5babbc2cfe7a9950d0bd38f31233f3fdb198fb272fc8142d0427e1233f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.4.0/atc-linux-arm64"
      sha256 "2be325919cfca7c21dbe223019b127fc9fe45994c3e6975575b89003045e88fa"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.4.0/atc-linux-x64"
      sha256 "9e55001d7f64acccccfd66a861abf8dd3771d618de17715f21bc98b86b559cf5"
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
