class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.7.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.7.3/atc-darwin-arm64"
      sha256 "c5687d97736eaf4e912f37c77c9e5e5315e102406b6db9d2cfac0151360abd88"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.7.3/atc-darwin-x64"
      sha256 "cf19a0231ec6849c1972b5a8d7bed3155af0bccc93d7456a7fbbcd152ceca1c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.7.3/atc-linux-arm64"
      sha256 "f37eb62061cde2b370ddae33fb9da2d3d424e9fdcd50ec1634fdd147193c35b5"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.7.3/atc-linux-x64"
      sha256 "0c79f600f1e64d1cdbc2c84a6c13f1f51250f7a4febf5c116b34dff07a551425"
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
