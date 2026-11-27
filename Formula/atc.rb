class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "8.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@8.0.0/atc-darwin-arm64"
      sha256 "e3fd8f67dcae8060ccaf3916e5a846ed9e75d2e83c7f7ab0e0fe778b75d71b23"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@8.0.0/atc-darwin-x64"
      sha256 "618f49d18cc6f4d20209b42292a7850e5cc4720d03d25ecd0e7fa55975116bbe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@8.0.0/atc-linux-arm64"
      sha256 "e0a34e0eae35c7da183e684004cc5bb79dbfe32c3d9e34fd0ed8edeb0dadc841"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@8.0.0/atc-linux-x64"
      sha256 "fb6c881456ad90c11b39ea96978216e41522ced5f34cfe9d36876bc850b2a173"
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
