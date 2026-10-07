class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.4.0/atc-darwin-arm64"
      sha256 "68a0ec95122ad5a863f3fd61279b0805873f2341298671e730e48993959eb23f"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.4.0/atc-darwin-x64"
      sha256 "064b8623a9f86fd2abb6ae95f68cf48d63b1b47e3d083a4b212f9222db772170"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.4.0/atc-linux-arm64"
      sha256 "123aee90c6ddc577eaa6a15df9b3b82ff0ee5eff4f1204538dea59f07e47621e"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.4.0/atc-linux-x64"
      sha256 "a93bdfb4370e1e68545420dc4e2b2c424b51d6bd14f4fc87e89150ff1b4bc346"
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
