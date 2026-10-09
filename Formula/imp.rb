class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.40.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.40.3/imp-darwin-arm64"
      sha256 "2b6ce6f5c289a29aa8ed2c2cd272294fef7ea8457a6560577182e11717628b80"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.40.3/imp-darwin-x64"
      sha256 "57c0ca71795c3ca15ee160154022b0db78cae73406f88b9efd5b832f7d21289d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.40.3/imp-linux-arm64"
      sha256 "a0c0f27dc04434eb5481cddc9b4962cd566cd207862b6aba6eaa00e51b613a10"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.40.3/imp-linux-x64"
      sha256 "21c770648ec94ab83e8aaebae7399181487b6d5d23f3fe20dc576105a9892702"
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
