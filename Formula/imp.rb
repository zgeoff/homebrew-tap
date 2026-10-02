class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.4.0/imp-darwin-arm64"
      sha256 "6f761604f96f0236e448e654f32ac2402a4451bb9cf5a7bfb97bcaefb67e1a4b"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.4.0/imp-darwin-x64"
      sha256 "6dcbf9484163d6146d6e5c84db1d0fbe3d2a2d275e6d795dfcec3cf2f8a0702e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.4.0/imp-linux-arm64"
      sha256 "146682a7596dc4e32f28446a5eb7d9b23dc491e5571d4cb9529fbf63183f222f"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.4.0/imp-linux-x64"
      sha256 "f78fee228caee7a8a73eca731c2003f084d3b9f1938f5feb63e8f58ffdfc1367"
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
