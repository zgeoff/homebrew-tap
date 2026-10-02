class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.8.0/atc-darwin-arm64"
      sha256 "f9976439dca29d84c564e25891328b4c04e10270029e815b1309994eba9c9d24"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.8.0/atc-darwin-x64"
      sha256 "4bbb9beaaed33b42fc4fee7d413a7fd25115dfab09b1fb804cecd112a3765bc2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.8.0/atc-linux-arm64"
      sha256 "6a3fe9e6533c748f6fc6fb40610769a83a240f1e04b57cf8de4d3d9cd15cfd10"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.8.0/atc-linux-x64"
      sha256 "11fdf09594193c673aa03b9c62b5c5327c559b27b36a3475db66102267422bf6"
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
