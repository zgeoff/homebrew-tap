class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "4.13.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.13.1/atc-darwin-arm64"
      sha256 "1060f4c87a58ecfd8312f70a10835e78a02e7ebe57b2791f35750676564cdec9"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.13.1/atc-darwin-x64"
      sha256 "f41115a8397d89639159ab6779272949c96761216a288bd2de694acb8f736bed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.13.1/atc-linux-arm64"
      sha256 "f54bf948888358c26ecfd1a829f7d445e1b3d747b808d68f9d7591f0ba86299d"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.13.1/atc-linux-x64"
      sha256 "04f3ef45f436f684b71ea708fabcb8621b60a25aa8c5f9ca999ce0f9a16e6791"
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
