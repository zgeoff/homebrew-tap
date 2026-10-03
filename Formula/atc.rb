class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.10.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.10.4/atc-darwin-arm64"
      sha256 "22d59e5d9cc834c6b6e3e9dda4ce52c097d8946d23652bff6556e2d19a77c2ea"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.10.4/atc-darwin-x64"
      sha256 "f3d98ee20e89fa03ebb78c4719236e931081f70630e8bcaab77c4213fd60bf18"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.10.4/atc-linux-arm64"
      sha256 "dac79809d97ea999dcb14a22a16a075a159349ca8424db77e154598048ecaff6"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.10.4/atc-linux-x64"
      sha256 "8cb6de042fc946cf1b5272f8c4be0442d89b120e3d376a6e6338636593d5c59e"
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
