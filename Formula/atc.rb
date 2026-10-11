class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "4.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.1.0/atc-darwin-arm64"
      sha256 "622687cedd7ff1b06e527ca2d7fdb2910e692fcee2be2732113754bcb4e7f315"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.1.0/atc-darwin-x64"
      sha256 "73da3aea659a77002ad99d3b4148d4e2c4694711a383c2ff55c18668ddaf5dfc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.1.0/atc-linux-arm64"
      sha256 "523a460b557339397178628e127a6a3c6f03a697113eed47174ff428fa444e3f"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.1.0/atc-linux-x64"
      sha256 "c50c0f1f737f3d867783967c36dff96f42ab2d8d1a60627afcc878ea64019f07"
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
