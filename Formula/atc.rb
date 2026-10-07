class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.1.0/atc-darwin-arm64"
      sha256 "bc2db69ab8646952c51096415342bc0914628039bc66796db3236bd827845c94"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.1.0/atc-darwin-x64"
      sha256 "e3067be1321cf29d78ebf8b788477609df4287cc8ea8b71271bcc4fe1562ef6b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.1.0/atc-linux-arm64"
      sha256 "a3aeb39a790f1d86f0f0c6c29391e41f13a064ee1a53297d6655e27f24ebf6c9"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.1.0/atc-linux-x64"
      sha256 "7b77bf90bc9dc01fb99b4c2612e59382857bad006c216326f09e36b4b017126c"
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
