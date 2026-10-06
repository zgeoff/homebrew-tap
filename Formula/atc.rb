class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.32.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.32.1/atc-darwin-arm64"
      sha256 "50ed94ab4ffb0907442f13097558e99e1822d785720427e3c2eebbc033cf52a0"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.32.1/atc-darwin-x64"
      sha256 "c1dc3361409245d8a320b82deed5f872b256a6297417935ccb7f5c9d710d2331"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.32.1/atc-linux-arm64"
      sha256 "e54decd5f18429bcf4125e6bb4cf369606e8dacd6d7e8936c78d45226b741b10"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.32.1/atc-linux-x64"
      sha256 "38bc1783c24cb49897dc7dc2b1b5dfbe221f4b3e819d0c955ac48a853d89311b"
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
