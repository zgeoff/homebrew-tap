class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.31.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.31.0/imp-darwin-arm64"
      sha256 "6f8c5497c298b4c4c9e50fbf0af4a9c42548191792e9c057522d24c1ee86cb66"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.31.0/imp-darwin-x64"
      sha256 "fb55aba3b0055b8e6e7c38ebfa0476044af1461c4e836e3ed790ccbb315f0d5c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.31.0/imp-linux-arm64"
      sha256 "fb602a52397c0efe91ef4f272409430201fb7595d1de382cff9e045fee883c25"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.31.0/imp-linux-x64"
      sha256 "3d0e68e042502b383c23752516e1f64bdf138bcbd87e0ea304596211fe823a0d"
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
