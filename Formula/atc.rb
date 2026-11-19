class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.20.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.20.0/atc-darwin-arm64"
      sha256 "c58d5be5f842c6413a89fdfd7d6820f2c2be45baddf0e6b0059687fb747570b6"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.20.0/atc-darwin-x64"
      sha256 "a27b8a7ea2b978e6fa42f12cf5b6f5caecee8ce79db2ad938b9b4dbc22aea743"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.20.0/atc-linux-arm64"
      sha256 "47c3f4d4741ad7854a43a8974952604ceccbd17f61f594b89afa891b4640a7e5"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.20.0/atc-linux-x64"
      sha256 "ca61f661fb4459a0c55f36496434db3efc790ad4e1ddb6fdf26d6dee09f45116"
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
