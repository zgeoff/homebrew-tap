class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.8.1/atc-darwin-arm64"
      sha256 "c74ad7b7ca99d5eeba3ba7fd1e4725088bdfa1e4bcb166cac68dcebbfc0cf6fe"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.8.1/atc-darwin-x64"
      sha256 "c441b75f2edbbef0e913ba498e69bda349d1504da92e4d541280f09a73eb1510"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.8.1/atc-linux-arm64"
      sha256 "752f0150c1fbbd7fccbbd0303cd76791cb725409198d51929b45b2efbf840678"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.8.1/atc-linux-x64"
      sha256 "daa5fec7551189039548068e1b162d2ef429de70a8cf80dcf38449ec7b452319"
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
