class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.31.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.31.1/atc-darwin-arm64"
      sha256 "1911372460e9020baed8c235f387d1dcbd58c2b831f89e3aa8778c87e6fd0d38"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.31.1/atc-darwin-x64"
      sha256 "bce234ae13fd5bb28ccf4af9f236b7dfd8533d2c681a110d340690ff6fe1434d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.31.1/atc-linux-arm64"
      sha256 "509ebe3fca8aab3a67ed4539d219d7b8762b837148d13916189d42cfdeb37ba7"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.31.1/atc-linux-x64"
      sha256 "21b4ce8db48fc692d399ec089e7a45d347df4d73dae1b2c478c3466e94cf1bac"
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
