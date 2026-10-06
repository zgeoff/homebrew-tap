class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.32.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.32.0/atc-darwin-arm64"
      sha256 "7da9a00f1a7d3e0ce35eb6943ec19a8cf6e8b6ccfb5c23a4cf82feb3ea61145c"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.32.0/atc-darwin-x64"
      sha256 "1b19c95f40aa6f5d343c96714c94af84729a5823bf82f2b311b2dc91065538dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.32.0/atc-linux-arm64"
      sha256 "762709003c5ffde4bb9bd34b91699fc644e5f9412e5a71ba8de5315c5efbb0a6"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.32.0/atc-linux-x64"
      sha256 "a4908c017c80734b9944f675422b5acb00769e580f9893ca7f53a16342e868af"
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
