class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.39.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.39.0/imp-darwin-arm64"
      sha256 "78c4b6c270a9354eb8ebe7a24ffc7e895a5c7be889efb8753f2e2ead164dd111"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.39.0/imp-darwin-x64"
      sha256 "b7b2fdbd0acfc3031ea9bc0d30b02294970169dd98c2e545e5a709c739f6c35b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.39.0/imp-linux-arm64"
      sha256 "de256ae7d99a629b56d9d76a229e9e9393b96b9f5e2ef9e235cdbf5b728e7253"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.39.0/imp-linux-x64"
      sha256 "b0b4eb102a119612f307cbc93bb5e9c7fa6a2f76dbbe4cdebd9c59ee9535b732"
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
