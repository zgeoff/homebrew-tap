class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "3.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v3.0.1/impz-darwin-arm64"
      sha256 "92060b13bc68d152c1eed4d2374b328f9d41582e82338520deaff78b18786a32"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v3.0.1/impz-darwin-x64"
      sha256 "c73932c86ee24f7ec413c41e888e8685da4111c5f135c4ae9c36884c83f332b4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v3.0.1/impz-linux-arm64"
      sha256 "6e0031e50e2c6f53692f01f682c2b981abc60a6b80606093e32de8298908b37a"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v3.0.1/impz-linux-x64"
      sha256 "e08d0cc399d284ff9ee6b7aafef50db723d301e6c1596b5bd41c1e14c525054f"
    end
  end

  def install
    # a bare download may arrive without +x, and the completions below run
    # the binary before Homebrew fixes modes
    binary = Dir["impz-*"].first
    chmod 0755, binary
    bin.install binary => "impz"
    generate_completions_from_executable(bin/"impz", "completion")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/impz --version").strip
  end
end
