class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.22.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.22.0/atc-darwin-arm64"
      sha256 "2f0b1cc52fc68a5afcee296ddd4a757a49a75797154fed223cecef3572393c25"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.22.0/atc-darwin-x64"
      sha256 "018a37014c136c3be18c7586b577c184c23ef58a9103d71d749f636f53109a99"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.22.0/atc-linux-arm64"
      sha256 "ea68a0d7db2507dd01da2c4ec4647ffa2d71dbdaa76b39d38b950f4b549d37ba"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.22.0/atc-linux-x64"
      sha256 "5c6ebac0fd06b53a5623f369cd09b692c86433b42d88477c4ba4436d4e73aea6"
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
