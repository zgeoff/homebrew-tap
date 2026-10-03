class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.27.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.27.0/imp-darwin-arm64"
      sha256 "7e84abc979ce1e17a4256511d14de6bf3873585e54f003ba50c2e22dc0cf03b1"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.27.0/imp-darwin-x64"
      sha256 "1d11a0e8774bf83ebcbfb5041199fb9f61f6a47252f5540dbecc9559cb0bfcbc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.27.0/imp-linux-arm64"
      sha256 "89f30a9906d0f58a3f258f83c0968d3e5e05c5d2d896166eba0d0d3520f19a0a"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.27.0/imp-linux-x64"
      sha256 "97f8829f30042a203e6ace5f9dea73ccff8cda87087a2c3fae83cb7eba91e8aa"
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
