class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.5.0/imp-darwin-arm64"
      sha256 "1b99561397807f4fdf2fde62a6917019400b9c83e637ba388c39f729b6125e19"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.5.0/imp-darwin-x64"
      sha256 "29b77cb45e7116bfde588319b96e3431323db8db4ef10fb74678edd0eb983967"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.5.0/imp-linux-arm64"
      sha256 "18481b2595c6bdcfb5c35875cf2b690ec3162a64ebfeab24ff9f2af82afbf0cb"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.5.0/imp-linux-x64"
      sha256 "a6bbfa584759c6bd2437774b929fab9f718f0b6514f24af69a89210aa83c1c41"
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
