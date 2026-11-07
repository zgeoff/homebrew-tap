class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.11.0/atc-darwin-arm64"
      sha256 "b96bb67d8f59fb4f79bb8f5c6224eb51289110301d3d9762d869bd9166553f1e"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.11.0/atc-darwin-x64"
      sha256 "2a2f5c2c126f91ffe270e3d680e7f826cb6f91ac211a511cdb2203e04312da30"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.11.0/atc-linux-arm64"
      sha256 "ef56344e247e742a78f0501741825e568603c200e271e60de7de861ae95f567e"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.11.0/atc-linux-x64"
      sha256 "f14eb5defdb6152c746980d88842e0a8c6fae39f251e35cd1274111e4c0a0f7f"
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
