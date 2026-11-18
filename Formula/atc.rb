class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.18.0/atc-darwin-arm64"
      sha256 "c799147a87dff009914dea474fbacb44d211e8f55a552d933c89dfd63754c45f"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.18.0/atc-darwin-x64"
      sha256 "33ac2b1a26f7a371e44c9ceba77ec8fa13d9352f5f50b91e95e6caf71c418a23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.18.0/atc-linux-arm64"
      sha256 "458597cf08761bb9a0dba506573994d0006fd383a5f0469c87a3822346362326"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.18.0/atc-linux-x64"
      sha256 "187a098b91fcfff9deaabd1f85c540bf6921217a9fbe155438029b95df4b33cf"
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
