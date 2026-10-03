class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.26.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.1/atc-darwin-arm64"
      sha256 "54635781b116cfafa3415e626793ec8ad02bc24f6a6189e6bba9dc5f11974fab"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.1/atc-darwin-x64"
      sha256 "ac40fbd642737532685ee8008ab48eafb72e3cf0920b1a36ed04668ccc72653e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.1/atc-linux-arm64"
      sha256 "5aa26a9f8d3994d3167bb936abacc864878348877f74202c363a3eb88f3c62f2"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.1/atc-linux-x64"
      sha256 "080894deaa5589468a2db601aa4ceba2fea89f0d2085fba0ac213658bf378372"
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
