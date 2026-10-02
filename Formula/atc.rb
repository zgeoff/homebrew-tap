class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.8.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.8.2/atc-darwin-arm64"
      sha256 "45a30e9b1d644696e1360ca94d785da91c904862cf7daa23d1d948bae2d2e0f7"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.8.2/atc-darwin-x64"
      sha256 "fc60a3816e656054d00910700486d450e5e475b4f3f1333522b77df52808f628"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.8.2/atc-linux-arm64"
      sha256 "5892597f1d4fd02da365291aec5e998d050de262f43a84053a2ddc90a4e78d59"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.8.2/atc-linux-x64"
      sha256 "1dce4be4025739fd70f2d3cb037256200554ca5b566e435ac3884b84afc92c20"
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
