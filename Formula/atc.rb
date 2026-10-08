class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.8.0/atc-darwin-arm64"
      sha256 "905136510afc9b201e4ad113c4ab653e9ee0a5d841861315a8574fddd1bace45"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.8.0/atc-darwin-x64"
      sha256 "a7b909ca0fd45afe5a7d4b28e0e07c4b309e4d8fc8eeb974a048f64ace73542d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.8.0/atc-linux-arm64"
      sha256 "4ecba36a0a60c1f7074a79508037e5f7ec289ad64178ac6caf6f994aedcb3246"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.8.0/atc-linux-x64"
      sha256 "1b65758f5d3dd769feee9bdc86806541b067053900f6708d13f7411653b67c5e"
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
