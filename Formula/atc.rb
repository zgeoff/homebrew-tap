class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.26.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.5/atc-darwin-arm64"
      sha256 "06efb33d3cbcdf629a6a8304d350f2302e7d2b08c2a39723edf2da926f58d589"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.5/atc-darwin-x64"
      sha256 "09ee24f41535c3bbb0be5a4e5aca027a204c5ec495d9965b6e19f36990daf882"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.5/atc-linux-arm64"
      sha256 "5d6660657a28b3dd1fb95cf0c8e9802072017ef3bfd67d9965d9e3199e599b37"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.5/atc-linux-x64"
      sha256 "e64557afba37d5373db6eeaee54a56d204be573f9a721fabb65239bc172020a3"
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
