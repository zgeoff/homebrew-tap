class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.33.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.33.0/atc-darwin-arm64"
      sha256 "8d893f5af83e8dba0290d514dfb85ace19c6d754ce949fae0435ee8987dd7855"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.33.0/atc-darwin-x64"
      sha256 "26da0f21c50f22b678624000df40c02b9dc66e33dba2943f682e3cd1b04cc4dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.33.0/atc-linux-arm64"
      sha256 "5f2c95230330452edfa09b3f5e186d0e4e979d578db1153239361af3c9c95cb5"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.33.0/atc-linux-x64"
      sha256 "e9e7a16ec4e61c2400d271666388420d7c583119a33a92cf6dfbed77b0e891dd"
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
