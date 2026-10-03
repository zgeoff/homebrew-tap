class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.24.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.24.0/imp-darwin-arm64"
      sha256 "be133fb7ba842efaa62aa76a8d6c112f6c5494038e1833d613ff0b49a5c7de7e"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.24.0/imp-darwin-x64"
      sha256 "ea6ff7fe67f7840fe516aab9972375fc6343e0754df06218225409aa794f1084"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.24.0/imp-linux-arm64"
      sha256 "77a5225eaf5d2a4f33d59f81d445bd9828d2e2b1fc719edafa64a8b607a2c4b6"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.24.0/imp-linux-x64"
      sha256 "ea278947488295401c671308e555d50a0717866db1bcf168c8c8ec1cc6a0bd1d"
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
