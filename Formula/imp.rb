class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.35.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.35.0/imp-darwin-arm64"
      sha256 "823501fb7032c0bd917054850f0c3d6978a7f75a76fb4463946fa3d0ced23978"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.35.0/imp-darwin-x64"
      sha256 "ee5956c76f21b4bd4c584d5a1a997ca7d4e7eea067fd1c4c5c3d898d453e1384"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.35.0/imp-linux-arm64"
      sha256 "b453c4e1fcf39f2de2a862ddde6088d8c21af9e665233ecde536b39b5b60a49e"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.35.0/imp-linux-x64"
      sha256 "58c3e35b525840a2411b625df8366072f1763561b3ad6987e459cd82fbe284ae"
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
