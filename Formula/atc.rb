class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.4.0/atc-darwin-arm64"
      sha256 "e5e145008c1cf3c9813faf65de7056af1c65bcb8e7ce1e1ea6a2705e4dc2aac4"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.4.0/atc-darwin-x64"
      sha256 "a4710e44e0907caa6ae7f84427808d581c438762476be8464ed708cda3b171f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.4.0/atc-linux-arm64"
      sha256 "8d99e922ea4aed0f502ca848422a4dde6782b02e61208e532a596b7592455b7e"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.4.0/atc-linux-x64"
      sha256 "7af978bd801c9d0992cbfdd7b15afb7d39a1eff670db84d30395080c76fa6b1a"
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
