class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.6.0/atc-darwin-arm64"
      sha256 "ab628ad63c7d622fce90a8d45057375b3118b86df0d53e29fc30e04482889775"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.6.0/atc-darwin-x64"
      sha256 "68f76214434d1bcf8b5c8f7eb5e51745dd36ea8975589f2d0fce786c3890ee13"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.6.0/atc-linux-arm64"
      sha256 "40865e3646181c9d7eeee9ca07d7e5c5f1c5eb2fec5ad24cb52617807021381e"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.6.0/atc-linux-x64"
      sha256 "6fbb6fd15c9fe3be3b9a67d6a66c2812be2f93070b72d742b6297b2db29d317f"
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
