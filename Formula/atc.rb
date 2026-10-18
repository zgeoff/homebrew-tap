class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "4.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.14.0/atc-darwin-arm64"
      sha256 "23f4dc86a8b15ef45f2bda69be7aeab57eb36d3c756668c0d291fc90545bdc40"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.14.0/atc-darwin-x64"
      sha256 "358888d797e58f24936e5a3615ac6572f25e69d02f0f41b9fd5bf53ac1869d4f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.14.0/atc-linux-arm64"
      sha256 "047eb33f069c8b9c1a50d0a27c77c31f2c4dd4c90297f967f59514e5c680dc7d"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.14.0/atc-linux-x64"
      sha256 "46bcc69b2420777cf0b59eed8d981c4b855d08ea61960f2f65012f531909b862"
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
