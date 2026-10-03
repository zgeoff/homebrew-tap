class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.20.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.20.0/atc-darwin-arm64"
      sha256 "f3a78e0b781918e34896dd1fc7012ddfa28cb3a851456ae69f4ca1ee0493e481"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.20.0/atc-darwin-x64"
      sha256 "c6884e092825f433f561fff41e6347b26ba53eb3a79b6e3639e5c0341d56bfbb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.20.0/atc-linux-arm64"
      sha256 "c3a36bfd187ca078e34b513eede433ad919ffe878ca28f2b2ea5b6b560effb05"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.20.0/atc-linux-x64"
      sha256 "a6c8fc3d28b4386aa091dd27f2706df8dde8e913c92ea6b027507e4a0c7149db"
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
