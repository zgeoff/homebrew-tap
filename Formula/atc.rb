class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.2.0/atc-darwin-arm64"
      sha256 "505e349308c4159103d03a7b3add180e33c6c2ce4e8d3c2a1b61854ff9a597a5"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.2.0/atc-darwin-x64"
      sha256 "addfabe54c08d181be8666e569ae0209c11922f918498c717ec188ed6890a63c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.2.0/atc-linux-arm64"
      sha256 "202f706e2594de56d1696c2549f6247e7fbef244c0f63d8b357d21badbc78b8b"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.2.0/atc-linux-x64"
      sha256 "8b8e96dbc8c1797f94e4a96c27014b024aa6f63d9cfc6c4157d44201b2671984"
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
