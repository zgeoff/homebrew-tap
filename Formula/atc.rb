class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.4.1/atc-darwin-arm64"
      sha256 "2605c2cff5cbd9e77f40bd3d89ee860517459768f5062455d815f1aba29c2f47"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.4.1/atc-darwin-x64"
      sha256 "2dac602920a270e0ee4b714e1fa60d7a61cc72a6296c8fb4911e34e94f1cf581"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.4.1/atc-linux-arm64"
      sha256 "9579e12bac7db3e24764c3feabf0da3951079a6f1176c09e9748695b66cccf26"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.4.1/atc-linux-x64"
      sha256 "0159e8d92af59204bd331ba90da9537bb790ef5feefef6b805ee6b462dadda60"
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
