class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.1.0/atc-darwin-arm64"
      sha256 "99c62a9cc6df6b5835eff725cefe1b44ef775d45dfe0d44606d449ffadca02f0"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.1.0/atc-darwin-x64"
      sha256 "71a07417be0f21ed81bb8928e746d2857e0934307f55f27cc45af4639f3c745e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.1.0/atc-linux-arm64"
      sha256 "c4cc1d7785c6d798f2ce3bdba2d862652fa587b37d7e3978d7e42911d6ff437a"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.1.0/atc-linux-x64"
      sha256 "861c9f1d09304f3cd4310f3546d338044d24e603896582c2fce38bcaa3618d52"
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
