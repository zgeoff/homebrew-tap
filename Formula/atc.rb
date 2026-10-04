class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.26.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.7/atc-darwin-arm64"
      sha256 "591329ef4494e9b0543f4563cf8264d939240107dd03e3997358f61be3e5cda6"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.7/atc-darwin-x64"
      sha256 "b0d9daaf0419bad9f0e6741fcd176bf33380238eb6293b1a17a3f8435052f254"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.7/atc-linux-arm64"
      sha256 "43a522e2e4e24ada2e2db724304be1c170e4ea47d272d47362120541f7166725"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.7/atc-linux-x64"
      sha256 "9691c63b1c2b5e15803cfb2022fa4aa385768eb3fbf990899bc423b8c91ee3ad"
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
