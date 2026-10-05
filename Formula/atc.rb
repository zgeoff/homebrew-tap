class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.28.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.28.0/atc-darwin-arm64"
      sha256 "342f07043776a8a36619d969d95ca8176cc760ec681e11fa82ca331ca4f2d832"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.28.0/atc-darwin-x64"
      sha256 "bd23b6c149f93bb84bbd9b3e16d00ba09132b00e2f35516b0e6428717c2e0a14"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.28.0/atc-linux-arm64"
      sha256 "766a42726f7b77e6025b4f8b9f20bee0743f530aa3ded5448576ed3551b089d0"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.28.0/atc-linux-x64"
      sha256 "89318a104d39ee4f31f06bbfc87d4e1a52cabf8e354786d0b577596ae00a2ec7"
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
