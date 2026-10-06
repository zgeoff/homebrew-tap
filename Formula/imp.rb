class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.37.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.37.0/imp-darwin-arm64"
      sha256 "6a560605dd608b115ad1af8384a5ca9758f5a76f29c705e9bcc323c862a90e37"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.37.0/imp-darwin-x64"
      sha256 "e7cb53e662cdfccb09257b7b78d38c67a0091751542f8d7dffa87fa231e69df6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.37.0/imp-linux-arm64"
      sha256 "1213a414e6f2641089a961f80a14ad1b8843fec5ef5c779b2901e60866c9d96f"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.37.0/imp-linux-x64"
      sha256 "7790ee0985d9ca369e5b6c8578a21dbbe3d38874e51d9bdcd24411e62c9b2ecc"
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
