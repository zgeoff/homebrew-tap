class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.29.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.29.0/imp-darwin-arm64"
      sha256 "9f7a49af8a7330c7d300ca46a5fb3816916ba39e70efa4e2602c78f870d76a03"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.29.0/imp-darwin-x64"
      sha256 "370d680160169e12296e1637162216b2ae88564be4026da21f7df1550a3254e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.29.0/imp-linux-arm64"
      sha256 "93bdbb5f5d7e67ee0671888eb83e6507d00ac4985f19caa43cb104b890c59df9"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.29.0/imp-linux-x64"
      sha256 "7df63ddf0ac1dc1a61ea17c87281b5a89493717c4ca4d9ef8b2d28d2bd91fe6b"
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
