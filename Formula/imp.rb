class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.36.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.36.0/imp-darwin-arm64"
      sha256 "d36fa8ae38137214241a5f1332be4311ffbf48834f3185d5cea2fa8444fe5165"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.36.0/imp-darwin-x64"
      sha256 "4eb02d2ce122518e3e36f35b68a71cdafd8cc1c5585fb06135c7a0aea7959501"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.36.0/imp-linux-arm64"
      sha256 "e45db11f86e0ec7169bb949316dacf7bcda13bfe7dd31e355f3a8bebaef1c709"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.36.0/imp-linux-x64"
      sha256 "9a1c080c8dc11c461e5f721518590d254251518d37918fa4db0f762876d7676c"
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
