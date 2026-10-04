class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.26.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.2/atc-darwin-arm64"
      sha256 "bee70fe48f6f663e522933505804b49d3949e96d744528e8ab971acda74110ab"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.2/atc-darwin-x64"
      sha256 "33b3b6e0aea30cf9545f10bb23daf3ee57b73c513070150f2675ffeb4804d3a2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.2/atc-linux-arm64"
      sha256 "cbefbcad469353fc8482b435e1f5dfc60bcaed28a78daf219a5caefdd1462f66"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.2/atc-linux-x64"
      sha256 "4d92b125a68edbd067ea0eaac493790402baa9102229df2843dea962250602e7"
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
