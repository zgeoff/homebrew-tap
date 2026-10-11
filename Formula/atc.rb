class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "4.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.2.0/atc-darwin-arm64"
      sha256 "76499e9cd28d2ec106d5a53f48cdbf16b83f0f6afa8a055f8e596e1baea864d5"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.2.0/atc-darwin-x64"
      sha256 "429cd137df80f061562439762c4bef148e15ca353c6db301b1f772f38f765990"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.2.0/atc-linux-arm64"
      sha256 "83666527f651366cdfa416b5d90527cc8ad781a201c59e0003363f45bbfe152a"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.2.0/atc-linux-x64"
      sha256 "28107e03fdec7466a316ebfd00002327aaa36989b44e8ca594c555e227d424d3"
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
