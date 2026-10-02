class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.7.0/atc-darwin-arm64"
      sha256 "2da581ebd770147f0c59ca5aa3a094ee1e9b4fcb65710e544df8e9ea44658e07"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.7.0/atc-darwin-x64"
      sha256 "b23fcaef0d41a8ad9b2f712eb0e77fb0b980dd4e8077d342ceb2c04d5aa48c3f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.7.0/atc-linux-arm64"
      sha256 "6f5d95bddd363ea83697a1200416c180e996a49273e489c86c10092e2e844c3f"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.7.0/atc-linux-x64"
      sha256 "4a6709cb0e9cef07c29c49594ad092c21feea7e71610a96c074cff0af0e63d0b"
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
