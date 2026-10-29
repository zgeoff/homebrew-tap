class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.5.1/atc-darwin-arm64"
      sha256 "08fbf1ac6900d4ff174b5c41a98c830b840c737cea0d58229269685d42b605d6"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.5.1/atc-darwin-x64"
      sha256 "6335618cedb84a7c4a7ed0b9efdd9bbb033d9ebf3455b97e5ac93623a5cc7ac4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.5.1/atc-linux-arm64"
      sha256 "c1129118d338db10ec7fb45d5ed4b2868c9d95292d38c830065a6579ca9c94a2"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.5.1/atc-linux-x64"
      sha256 "dc661496144cc96c703246f7cf80ff312033232cb4cefd6e6fb52510621cf540"
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
