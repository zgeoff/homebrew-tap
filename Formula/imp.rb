class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.3.0/imp-darwin-arm64"
      sha256 "c7a7e35b318a805a47a8270c41cc5bc42d1e80a726b966e5e63f929da44766aa"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.3.0/imp-darwin-x64"
      sha256 "2087af40fb1b8b0ccbf94dd94321be7cab66ceae38d951697a87516500c5d1ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.3.0/imp-linux-arm64"
      sha256 "1af9c8feaa572afec33065f7d9f7398978c101245f272a5dcb9c3aaf67710f37"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.3.0/imp-linux-x64"
      sha256 "15697ae09bbaa520ceebcb98154133b7b6ee9f7dacef5d7635302f6b0429e033"
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
