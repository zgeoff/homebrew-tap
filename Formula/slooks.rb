class Slooks < Formula
  desc "Slack hooks daemon: run shell commands on Slack events, as you"
  homepage "https://github.com/zgeoff/slooks"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/slooks/releases/download/@zgeoff/slooks@0.2.1/slooks-darwin-arm64"
      sha256 "fcaf6513f07c5dfbf2ec9ae40620874f3bbeea505e57434a38234d0f4d9eb2f1"
    end
    on_intel do
      url "https://github.com/zgeoff/slooks/releases/download/@zgeoff/slooks@0.2.1/slooks-darwin-x64"
      sha256 "579f0bce1a733bd5f4277dc129045070988ba822eb116152c8db9901e07e6b05"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/slooks/releases/download/@zgeoff/slooks@0.2.1/slooks-linux-arm64"
      sha256 "acaef181eaa8d38e54f796146a06cc449c31fdf04eaacc51355c00c39348a4f2"
    end
    on_intel do
      url "https://github.com/zgeoff/slooks/releases/download/@zgeoff/slooks@0.2.1/slooks-linux-x64"
      sha256 "8cb36a2a55e1fabe6e5c010bab5c64a426f5a8d26b4ec51e09c5aac63d5f6c0f"
    end
  end

  def install
    binary = Dir["slooks-*"].first
    bin.install binary => "slooks"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/slooks --version")
  end
end
