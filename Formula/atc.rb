class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.19.0/atc-darwin-arm64"
      sha256 "94adb1f5096abd6120bdf1527fa0312b01fb1943646bb40206551bbf2603d168"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.19.0/atc-darwin-x64"
      sha256 "97a1470ef2c93c65985ecb35514823851f3341b608d3b83b4cf1641b5fcaa8c2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.19.0/atc-linux-arm64"
      sha256 "65a3d8d959469714cb03eb7cf391208f60fb01c1cc0d56151855164e3f3b12a9"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.19.0/atc-linux-x64"
      sha256 "b08968a2ebf9640fff34ad5a9d24d609f6c9cd02ba4cfa85db8bb4de47d6cfde"
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
