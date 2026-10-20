class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "6.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@6.0.0/atc-darwin-arm64"
      sha256 "779986176a705b2295fc7a66736a8b467cea8e94f822ec43808e1df631984799"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@6.0.0/atc-darwin-x64"
      sha256 "d712e416f393462ad0c31c1dd4b4967d8bb50b60ad96fe8a85e48e10d8ab8d26"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@6.0.0/atc-linux-arm64"
      sha256 "80a42b2b0ed847269d3201f2507aa24817c0b4c93ba8d39a5fafb91556a36ffc"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@6.0.0/atc-linux-x64"
      sha256 "8d1b3513b06b38023f315e3197217d6cadc4f6144defa72eda6cd3bfe70523f3"
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
