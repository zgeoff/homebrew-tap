class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.11.0/atc-darwin-arm64"
      sha256 "fab4d314b847b59672ffb912b1df0e90571cff2b067f1579db9aea4f4e289bad"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.11.0/atc-darwin-x64"
      sha256 "696a8775216dbd0dea449a75a4f2907c8e44c03cf6bdd785fc04cb8d4ff41020"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.11.0/atc-linux-arm64"
      sha256 "0f8fa9aa06e8c57168d167286c756a31acd90eb70851a400192b647f6f6b68a8"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.11.0/atc-linux-x64"
      sha256 "5ee91cb3dff7006a7cb94bbf254698d930639f1566bfafe1763fbc052d80d8bd"
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
