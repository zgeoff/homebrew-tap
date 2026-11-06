class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.10.0/atc-darwin-arm64"
      sha256 "2201543f823b49a566b0ea02f734609f86f5dd6baea9e36721489e18e62a98de"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.10.0/atc-darwin-x64"
      sha256 "3ac0176f71a41e80be5c2f4ba8efe0e299333c1b2486d2ce707376c9060ff8fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.10.0/atc-linux-arm64"
      sha256 "50a2c2f41f880f736a9b3e7d769af64410c0c91453249ead308a6ecc11e7bfad"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.10.0/atc-linux-x64"
      sha256 "915cc8422a0468fda9240f829487bdf505e60e41411b6ab3e88a22d8a74edc98"
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
