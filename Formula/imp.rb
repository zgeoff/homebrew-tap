class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.38.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.38.0/imp-darwin-arm64"
      sha256 "f1b0b8e315ed045822197a46f4500ea5003e5c9de5de0474fee599bf59e291cb"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.38.0/imp-darwin-x64"
      sha256 "499a5c2ec967dfc1dce4d238d61853794d743f538ac2d898fbabc24f8b9e744f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.38.0/imp-linux-arm64"
      sha256 "ba0234f906bdcb3a3a55d3114ebf8260c03924d7806cd3841b0ec3afb308c2ce"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.38.0/imp-linux-x64"
      sha256 "550db943833c31930c25edd530f9d13fb6631fe81c4cb6b9196c9355d92bc11d"
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
