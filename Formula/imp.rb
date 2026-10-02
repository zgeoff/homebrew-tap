class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.6.0/imp-darwin-arm64"
      sha256 "d330ee3a1e36b5375dcdf60793ed8c2d2ddf5d43ae53572eec3a709e9e8bf2ad"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.6.0/imp-darwin-x64"
      sha256 "2590493aa31499ec981f522aa07f488d7cc581b1103c465dbc84eb6f45b8fcc9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.6.0/imp-linux-arm64"
      sha256 "097f5cf32ef3500a25c49e66bd23eeb7c78deb4973815efb3e26e870420fef7c"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.6.0/imp-linux-x64"
      sha256 "b833d24b163fe19b1cf548a07f60e6adaad74650d285435c4107c8e6a5b4be4e"
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
