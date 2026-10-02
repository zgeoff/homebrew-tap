class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.1.0/imp-darwin-arm64"
      sha256 "84ab712197e3469aea60a7f526386eeace0d3ddffe0c75d512ee0ed4bcea8a71"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.1.0/imp-darwin-x64"
      sha256 "9602efe178c9fb763cc93110c36b34effd827b4d451eee1b25cdf7a20bd985c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.1.0/imp-linux-arm64"
      sha256 "7a8fb020145ec9bf5ce5b24fa28294d993a8ca25d40f4a199cdfd311837faa4f"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.1.0/imp-linux-x64"
      sha256 "236f3923eaaaeeceecd3e812896a3018ab1517c3b1d1692d3be2e06b91b6d2e2"
    end
  end

  def install
    # a bare download may arrive without +x, and the completions below run
    # the binary before Homebrew fixes modes
    binary = Dir["imp-*"].first
    chmod 0755, binary
    bin.install binary => "imp"
    generate_completions_from_executable(bin/"imp", "completion")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/imp --version").strip
  end
end
