class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.16.0/atc-darwin-arm64"
      sha256 "9183f187e0a0cd3cb980cd735023b7d8fda46db32590dbad1cb1abb205742f58"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.16.0/atc-darwin-x64"
      sha256 "57c2da29741a6fa0604d27982d5d37c6c5d4fbbe9a8dff700dbadee7499b62ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.16.0/atc-linux-arm64"
      sha256 "7c6db8a42b1f6585b7b226962326bbaca384f325172938dc952c9161728e0717"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.16.0/atc-linux-x64"
      sha256 "d23040026892e89ee159c889d50d0950358ef0f10ca04e83de055640b6fdf608"
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
