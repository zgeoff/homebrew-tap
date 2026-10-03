class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.15.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.15.2/atc-darwin-arm64"
      sha256 "88fee22aca40c6fe8173860236a480143e6e259d04752763f6548775cea6d579"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.15.2/atc-darwin-x64"
      sha256 "d4633801d871df351a857e5210911c9dc3e42c60e89b73b76ef77b16f36501a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.15.2/atc-linux-arm64"
      sha256 "e3a50e93076c9b6bdee5bc5e687ec488cb54ef79d3e7759d4888346f768fadf7"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.15.2/atc-linux-x64"
      sha256 "81519f0b770a42aa0f3a130ff4c63a92b5cb37f3234b3a0bc5a948a8c026b90f"
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
