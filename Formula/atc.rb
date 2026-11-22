class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.25.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.25.0/atc-darwin-arm64"
      sha256 "a76ae981b534424164248920cd233b4f44a9bb8bb83b614db168e0674d249725"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.25.0/atc-darwin-x64"
      sha256 "41518a342f076b125a91c43e1bb00993d3074b30412fd1787c18a691fe7e496c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.25.0/atc-linux-arm64"
      sha256 "e2464530f4b7d40966912fdfefb209c9b06a5ae3ea8c6944fd628e5c2c5ac65f"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.25.0/atc-linux-x64"
      sha256 "440bd2c17d6e27c0547e4a28b756945188cbd4c3e42deb721bf962311dbc2508"
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
