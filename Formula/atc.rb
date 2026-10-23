class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.2.0/atc-darwin-arm64"
      sha256 "b11a0f6fd12c1c6c2db028d3270bfdedb4c0ba21dbaec4f140c64c1a4a6e4324"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.2.0/atc-darwin-x64"
      sha256 "2757e2c5307d5c6bf02f5e77c0627e22e8207c196164f2c84e69567daa890f85"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.2.0/atc-linux-arm64"
      sha256 "b060bf14e0af6e55a20d2a9b8a188a9f6e5c3e6238c10fd3603fe9ed21a124f6"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.2.0/atc-linux-x64"
      sha256 "af0ccae8107ae263000737dbec511226351bfbc5bae6dd0e4af107e469860b95"
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
