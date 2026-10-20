class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "6.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@6.0.1/atc-darwin-arm64"
      sha256 "1b3291b94334921eef73c25dbc6f5e7f37b14bfea8ebf52272c72a32d269479c"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@6.0.1/atc-darwin-x64"
      sha256 "b154d5de2bd57a3a0782b0fa9e0678a789fd2a93d3b801f832243e9395d86a51"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@6.0.1/atc-linux-arm64"
      sha256 "d9d912c21b1e7f7385330b1e87bc65958da2796bc25f44134a2f5d4a499bb922"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@6.0.1/atc-linux-x64"
      sha256 "5dd89072a90206c120f6104e78523364afe5c4a18db7b83353a12f6c5b8786a1"
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
