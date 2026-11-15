class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.17.0/atc-darwin-arm64"
      sha256 "ca90f7bfdeddf54e3fd9e4055e8994d3f9d76c0db968b9c05ec3deee915a5a57"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.17.0/atc-darwin-x64"
      sha256 "885ea9e28ce526554a954e949f033b9834a1eab094694847f7a9b99d11f506d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.17.0/atc-linux-arm64"
      sha256 "d724e27c6123485cc859a160567ecb27d13987c92314bcba2c3ee2a1f0ba9b19"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.17.0/atc-linux-x64"
      sha256 "d59d53ce7da579fba9236c383cef995cd40ded69ca4344db131f0354313e860b"
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
