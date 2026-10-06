class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.31.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.31.0/atc-darwin-arm64"
      sha256 "31cc5ca48f80b75bb112bb6c8522ce20fd291e8b4f51a3de193465c988a1fefa"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.31.0/atc-darwin-x64"
      sha256 "055d638bce8045bc30b4f671aed3e090a938b2bc961b4f4ddefb96a5c40fd258"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.31.0/atc-linux-arm64"
      sha256 "8b74065e4b5895f6f6f348aeb7d5ec61407a9eec66039f2079c16d725e226713"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.31.0/atc-linux-x64"
      sha256 "6a41e889b6e58af5df058ec8c38b46cbd677c43f711b063ae38d0287a396a86b"
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
