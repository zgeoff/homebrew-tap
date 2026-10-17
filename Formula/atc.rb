class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "4.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.13.0/atc-darwin-arm64"
      sha256 "b1ca924ca09b2e149c956cd54fd285a3894c96bb10447a0d11e845533aad90da"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.13.0/atc-darwin-x64"
      sha256 "02fce59d1b60039328487ee0585c006b4a6032aff95e3db4fde612463a597893"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.13.0/atc-linux-arm64"
      sha256 "0e2949bf397b0c2edcbf37e3f72492eed5d96d01f1f53cf9aa9cd1477e4fb861"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.13.0/atc-linux-x64"
      sha256 "b1eed5868d17887a6f6aa0ef4f3a68212163b4427c5acfd776f7cbcc0cd1e781"
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
