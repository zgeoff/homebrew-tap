class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.9.0/atc-darwin-arm64"
      sha256 "92ec2fd7283e89b2674e197a4f29dc921f17b9f4e3bc17fc380a4fb4e619524a"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.9.0/atc-darwin-x64"
      sha256 "5a976955bd43f849fcb1ff0797adc69090cce5bc9a88b3b422bd7971eb1fef50"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.9.0/atc-linux-arm64"
      sha256 "a0639e4884d0a667eeb62dfb8b359c7e15b756e3387dc221062519d3d74097b0"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.9.0/atc-linux-x64"
      sha256 "7178a07d5302ed76cafc9fbcd558dea843d348e3ec59e7aaae7fa887d90b2a0b"
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
