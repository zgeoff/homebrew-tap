class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.23.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.23.0/atc-darwin-arm64"
      sha256 "c5318a4dfc340ecd01c78589e572f0be271657d68d3553875a40e1dc9ddc0420"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.23.0/atc-darwin-x64"
      sha256 "8f96221ca928761af75d8dc855c9465946a8dd323544e90393dffd1c279d1b7c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.23.0/atc-linux-arm64"
      sha256 "c93d1c4c4ca512e55fad3b496d9ae3f106435ceff6b6c76e49770d44b067b461"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.23.0/atc-linux-x64"
      sha256 "852c9aaa9b7a55942ecf1b3cba433b7cf953a2bc8a97bb175e7a116dc9bdb54f"
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
