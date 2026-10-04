class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.30.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.30.0/imp-darwin-arm64"
      sha256 "bec78d44679dca04eef531caaa081a2ac2b15b5a11a249bd924076aee356382c"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.30.0/imp-darwin-x64"
      sha256 "d65c557e58804ba27f2e7474a8a7a8a590c8d3a6b59bb7cbda9aed6e127a632c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.30.0/imp-linux-arm64"
      sha256 "529571820ff543484fd4bc11cd29eb3db80a9eccf4a54abe2a0c01517d2a6ca2"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.30.0/imp-linux-x64"
      sha256 "3988262eb89b5bc6dceaaf929e9037d46681e0bb6e5f665fcf297b82e6041c20"
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
