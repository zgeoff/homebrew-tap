class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.7.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.7.4/atc-darwin-arm64"
      sha256 "8b713ce78790476ba8e5938ea079b6c296b146a98a6a3e336eab3a7a6ef472f3"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.7.4/atc-darwin-x64"
      sha256 "4d7d4af5f7dd8b59de36bec01fbe75503ddc4d135bc867f8f1400bcbe3c2546f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.7.4/atc-linux-arm64"
      sha256 "08835ffcb826221397ef2a8369ff2311a942da20d63fe1d7c2445e90a2561e24"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.7.4/atc-linux-x64"
      sha256 "493aada4b5573995f75f697805f5170a219eb685a033ad93aa913a7348556bda"
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
