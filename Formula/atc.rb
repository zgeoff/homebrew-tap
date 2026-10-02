class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.10.0/atc-darwin-arm64"
      sha256 "def8936fad7cf5698889914e9ac8bf3b711843a6faa6e260492da557b956025c"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.10.0/atc-darwin-x64"
      sha256 "772223e6def13668d4b6731d76ee5a31deaec48fd6a4755d6b2b5d061897ae74"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.10.0/atc-linux-arm64"
      sha256 "d0014d8ac6fcb4d217f92b1465ea117bffc085d3454e34095675a965666fa0e4"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.10.0/atc-linux-x64"
      sha256 "749d0cfc5f30d75fd94e09899d1775032e2a3aca1b5d9b22ec0e9628f54bf764"
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
