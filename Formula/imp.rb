class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.2.1/imp-darwin-arm64"
      sha256 "9426d550a09c052515930b695d823037ab52ccbc019a3bb8fb98f788c173d36d"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.2.1/imp-darwin-x64"
      sha256 "e3792e33ecb6b045740bb30f7f2948f1dc132e1875c6df70498d73ed41d0428e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.2.1/imp-linux-arm64"
      sha256 "7deb08b21dd7ebeaac3701f9d50172c7b454d5afb63ac78893188af8ecbc6523"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.2.1/imp-linux-x64"
      sha256 "767221f7f99c8daa9e35f29c7dac8d0805c63d4e24c5ad366ca1067e91e38243"
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
