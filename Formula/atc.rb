class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.25.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.25.1/atc-darwin-arm64"
      sha256 "dc5b90dc5bedd413fd872665fd21f5e7c6f69f0a58a2e16ce14341fb9ffb59bd"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.25.1/atc-darwin-x64"
      sha256 "ca14ddcf9cf078d7bcbb2a3ed0628824797f32d222a4d6f2a5e8860c6435e916"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.25.1/atc-linux-arm64"
      sha256 "aa1e6de1a2907c216f8341dc675403371eb1c607f53deb2058cbdb997f66bfbe"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.25.1/atc-linux-x64"
      sha256 "a6915ad39976550da471b2d6632a0d105a92b8cc0d7a12444d92902f5762ed57"
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
