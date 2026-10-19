class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "5.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@5.0.0/atc-darwin-arm64"
      sha256 "6c8924b815cef2239431b4e9c0e07819222e8e2ae6f28f6b542b9fd4c2f94343"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@5.0.0/atc-darwin-x64"
      sha256 "f3e22fe694f4c523c851bcc33e2f9b61642acfead5b682d6a30e01db7d398934"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@5.0.0/atc-linux-arm64"
      sha256 "4ba3cb0eeede4410eb169d5552f9e82724b481e8a47939052ccd26a6311369be"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@5.0.0/atc-linux-x64"
      sha256 "51078e77bf3dc8f76f8ba1597b6c9c6cc7bc9d82a0ab73587892747cef6e7e91"
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
