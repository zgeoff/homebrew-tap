class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.37.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.37.0/atc-darwin-arm64"
      sha256 "abcd6e428c93b0397982bd3a1e7691602dd0541977818eb7cd03e5353cb18ae8"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.37.0/atc-darwin-x64"
      sha256 "2cf3dc30f92f24b7f3c1a2791a63072c6b5fe4b7473374b70a96ec7ca07762a2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.37.0/atc-linux-arm64"
      sha256 "7cca52e4d7b681e92bca339e9d9855612b599d12a9c05c508f5b3dab187f6334"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.37.0/atc-linux-x64"
      sha256 "968e3646cedd91c74ee187895b1db541624659addfccbf46dba69123b11242a4"
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
