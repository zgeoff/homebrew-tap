class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.0.0/atc-darwin-arm64"
      sha256 "093eca73c73cf7c31bc83988916dc3f5b686540695b2339b706e6919449143d8"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.0.0/atc-darwin-x64"
      sha256 "48741577300c84fc4461e105f8338bc5a2aa0b4195b389c47601c8aaf9b5f3ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.0.0/atc-linux-arm64"
      sha256 "4f5ee9df28e6b27f73c291099979314d6207cef7fe4c5f1ab325eb02f8ac0a96"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.0.0/atc-linux-x64"
      sha256 "a9576bd29dd05b3d15d8957c9139f41a3002a06b8fa96b4e130a603260737375"
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
