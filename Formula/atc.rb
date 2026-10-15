class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "4.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.10.0/atc-darwin-arm64"
      sha256 "55d43ede040f376b28206f6eced3f9a0caa7e5f29568f263c2a4fe71b780e0f2"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.10.0/atc-darwin-x64"
      sha256 "069ea65e8a5bbdd5b06e522420fece24db3ea100178c0e0e43a1672c7487fc6c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.10.0/atc-linux-arm64"
      sha256 "440cd4559b5c3b750f414029bc2205410b5716df80f9f9308c8a185c2860d7f5"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.10.0/atc-linux-x64"
      sha256 "369416c240eb2c69bafdef54c2861c944011da09ecb82dbc044d7cbed8544e55"
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
