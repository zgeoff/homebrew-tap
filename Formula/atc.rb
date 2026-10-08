class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.9.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.9.4/atc-darwin-arm64"
      sha256 "bff43c78f9a21a0b53246eeff7ca4a6b3e2117b19b15ab919be2c6212a30d1fb"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.9.4/atc-darwin-x64"
      sha256 "890aab2b20cfd22d4edc9ef79474a08f99cd258a6a7698a34d7337e9a2936e86"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.9.4/atc-linux-arm64"
      sha256 "608f348d649e0ce50e7ebc993e9a7b357892f5c53a70acfad66fe98970fa9154"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.9.4/atc-linux-x64"
      sha256 "96e29804ed8e56b1a087246f8ea976183fbcd55e9027a96dd2a41b9e3f6d595f"
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
