class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.5.0/atc-darwin-arm64"
      sha256 "5f5b16c84fc252dc2b517c208ecb99ab1ea2d2bf615dc0c543871dba044ed197"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.5.0/atc-darwin-x64"
      sha256 "3c36491a46aff54e23deda2861e979ce5f5f261a9a0cf7b16a782270c3bd6d0c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.5.0/atc-linux-arm64"
      sha256 "21a4b7c0d9ca6396524b0cb722d33d8d01ea0c3bc3ffc8ebc12056035184f800"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.5.0/atc-linux-x64"
      sha256 "71ed45bbbb66a8cf6cc39a96013172a8f0274a4385cc5fc095f016a59cf34b29"
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
