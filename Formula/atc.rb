class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.12.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.12.1/atc-darwin-arm64"
      sha256 "b2b2e8cee4f778b3e18301348c16a8778c42d0bb5218b9e9c357570db6d3ba89"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.12.1/atc-darwin-x64"
      sha256 "f2359a21a42e5c46872495639fee39687de7e1fdb07953c8b9f04cf8056b0978"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.12.1/atc-linux-arm64"
      sha256 "f52525006629f76489c708becc6d441c1c4214bf42ced81c9e5a8144e25bd42c"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.12.1/atc-linux-x64"
      sha256 "846a7752216c7b1b7f3593f534173895762d9d104797fc55c78c7a764eeff9d1"
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
