class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "1.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.6.0/imp-darwin-arm64"
      sha256 "c269f5d0c9fd0ca15f96ee920e15c9e047607eab4d92cd47d5e1769036242fbc"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.6.0/imp-darwin-x64"
      sha256 "0d1651e80d712659a2377a558a7e7c330f52569d675c6c49c09348020b813246"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.6.0/imp-linux-arm64"
      sha256 "8f6649dcc58c4ca13bd44e5a1d4d7818cf5cd574ffb67bc616b4ccfe52e38da1"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.6.0/imp-linux-x64"
      sha256 "b54e8ee52edbb6ee239c7217d24023f65a1bc97ab62e49e9d278758612a9cb7f"
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
