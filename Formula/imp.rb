class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.16.0/imp-darwin-arm64"
      sha256 "2dc721bdf3cb11353d88abdbd097eaffe11532c635cc18fe3e72a5955f294f89"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.16.0/imp-darwin-x64"
      sha256 "60a74596e39918b852f6e464be45d1247c0042a6814f61a75791eb5b08ce4033"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.16.0/imp-linux-arm64"
      sha256 "8cc3e63e13a2fc0dce0c46a463d8ae8cb7fa0c92b94fb56f0d6919df71c27289"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.16.0/imp-linux-x64"
      sha256 "452e6a93fa3ef445f49e56bea6d1387c02d1e470169f28109c4852cb0edbb046"
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
