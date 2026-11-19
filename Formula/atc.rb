class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.19.0/atc-darwin-arm64"
      sha256 "9e561fca7afbbd486a17b603f64004a936a61e7ecd86cc0a69bc067cfa108717"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.19.0/atc-darwin-x64"
      sha256 "e18c9c4f9c5f70f667228747a974bcdaf4aead81bae8848e9a647e0312aa14e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.19.0/atc-linux-arm64"
      sha256 "71974c8148197435ee49999994c48d3f804441a5e46cf49a2a7df9b058d78d08"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.19.0/atc-linux-x64"
      sha256 "0e09cf1fc8af3d56bfd7d13317944c370d5ece6001145eb49f4e33c8c3f71b4d"
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
