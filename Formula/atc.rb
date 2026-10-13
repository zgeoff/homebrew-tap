class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "4.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.4.0/atc-darwin-arm64"
      sha256 "5f8d475f527008c4e03c4b2c7db9af8bbee8220bd0521a9d4e3e2e1d7b4a7b30"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.4.0/atc-darwin-x64"
      sha256 "efa6994ff251bddee6c29d376a8cd7c32727ef09702d094c6f5ef772c70e26d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.4.0/atc-linux-arm64"
      sha256 "8927fee68c9a5518dff338e39ec93bc829a4aea6035c6b78438c7387bd4831ab"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.4.0/atc-linux-x64"
      sha256 "8e00869830945b8310e9ec3f9566a43a4dd2a08cbedcca033e0ad3239d0847c9"
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
