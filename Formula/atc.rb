class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.14.0/atc-darwin-arm64"
      sha256 "9ec24f08e1f5c89e489bfef7dcb4e6e9d29d1e44694f15992941caf1e6e1db6d"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.14.0/atc-darwin-x64"
      sha256 "96634f8ab3e01d169a81862bece8e4e2e6c1d62b2f620a94e935596a750a45ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.14.0/atc-linux-arm64"
      sha256 "fb2c86f1a84e3587498e39b28f99171bdae0016a6305a1088314c9bd5c51ebec"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.14.0/atc-linux-x64"
      sha256 "ff1abf2ef4d42ca91f90d6a76b66f6ccfc790112dd03017962ca52f2b88311c8"
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
