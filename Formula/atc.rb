class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.10.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.10.2/atc-darwin-arm64"
      sha256 "2eceb297d12f4dce36e3377272612669bbbb833ea0915c89b5bb77f8c8c440d3"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.10.2/atc-darwin-x64"
      sha256 "3e722a3ad1c570a702aef6f866455825b7780db17c2fc6675340133fc7a69e7f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.10.2/atc-linux-arm64"
      sha256 "293278449c6fc46ffd3dc5d155ba7917d08edc5321d65bc8a3d0152b17834b3a"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.10.2/atc-linux-x64"
      sha256 "5796103f2340565d1721a68d46c17e68d74dbe4bdf1cba5ebe4a4fbd857d4025"
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
