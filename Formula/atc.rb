class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.11.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.11.2/atc-darwin-arm64"
      sha256 "2acbef1ef13b1b6ba38328f717946bc2556c1d6add806e2c00c71b4719a6e50e"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.11.2/atc-darwin-x64"
      sha256 "a4c2e7d6778eca1c9347666ed2fd52ee5fea23b3c305ac3c3b56e64839e7ed33"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.11.2/atc-linux-arm64"
      sha256 "43b4fe4e85a9658ede1065b5719b2eafff7b500153893f650e0ac07d1c79b0fc"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.11.2/atc-linux-x64"
      sha256 "ecda6e5428700b4d8927cdd373fa4b4aff10b38489b81c4b0d7a405010af11f4"
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
