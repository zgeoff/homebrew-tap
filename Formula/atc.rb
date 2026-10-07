class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.40.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.40.0/atc-darwin-arm64"
      sha256 "f0e2f03b02918a6fd6827fbe2b499c845b7731d2b1255cf0c5dfe5f061aa39bf"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.40.0/atc-darwin-x64"
      sha256 "92b3c67ae68cf48733bc2e90dd18a0d7ae49fb364c9a3c77c630aa0eeb7e7ae9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.40.0/atc-linux-arm64"
      sha256 "2e8b03082153fb2af17554f29d8d2d321e5e80876a9296a88046d41ec256f5d3"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.40.0/atc-linux-x64"
      sha256 "408d4288fd71ea3f933582a95ade3b0536623f34449e236fcad6b199998bca59"
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
