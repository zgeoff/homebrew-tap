class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.13.0/atc-darwin-arm64"
      sha256 "cd84144ca3cff966e187850a1bbed8ede88fd342b14d08376bbcd48153aabd7d"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.13.0/atc-darwin-x64"
      sha256 "4da71d719b580aa68bd145b77d67215e7a1defb4ef760465a3ee31e19df27e59"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.13.0/atc-linux-arm64"
      sha256 "3c8cad328b4cb454d3a8e93d29460a30a5edb9353ff7fc06a4653d57629644c1"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.13.0/atc-linux-x64"
      sha256 "e8557896e0508faac6a22653bee441a7cac93d5d02710a84899b458ab079ca9e"
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
