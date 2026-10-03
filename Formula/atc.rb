class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.25.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.25.0/atc-darwin-arm64"
      sha256 "76b46aa7eac2d7189b973126416647e91e986f27197f4e5c26b1e2d067ac2dbe"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.25.0/atc-darwin-x64"
      sha256 "dc940ccae433207fd5e94542b47cf464a7fd40cd07e7039267c0bcce109d0338"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.25.0/atc-linux-arm64"
      sha256 "85063f82949a67604d59218e277218b0fc4212b6fee042967aa12e3c9f975ebe"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.25.0/atc-linux-x64"
      sha256 "4f080cd1cd7f86c83c6431276135dcafe97ba2930e59fe63bba7391c8acd26e4"
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
