class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.17.0/atc-darwin-arm64"
      sha256 "655438228e1f639f2c66a48c63be91fbac4733e06896aee76dcc5aa750b69dc7"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.17.0/atc-darwin-x64"
      sha256 "ac4f4eed0338c595240384b42a86cd45ca192019561551266020caa0b1ad4741"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.17.0/atc-linux-arm64"
      sha256 "b358178b80ff9307d3339f31b5bc989895322ca12b53f7e4984b30490ffabd29"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.17.0/atc-linux-x64"
      sha256 "661fef8113332d21c4c0ea8e28d8acfe940de523501586cfc0521c4ec921a042"
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
