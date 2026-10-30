class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.7.0/atc-darwin-arm64"
      sha256 "0486683a8f0120209bc208d16c969679a848285e84a1f2b88468f2e9fc1358af"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.7.0/atc-darwin-x64"
      sha256 "bdcfd229236f6292da5e3d2afda3181e223e3bf5e6179ca78f3ca23422e1c50a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.7.0/atc-linux-arm64"
      sha256 "50f148383b5f049e93a31bddd82e1e83fc94c6b4c145e94473fb6b59f236f222"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.7.0/atc-linux-x64"
      sha256 "b7dbf84921b115b6fa8d5bcbb2097ec18e89153874d3c625461497eddb431491"
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
