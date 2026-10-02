class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.12.0/imp-darwin-arm64"
      sha256 "52bd5a3a02719e0933697704d175238205c1fb90c33f62ce23657a163a526abb"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.12.0/imp-darwin-x64"
      sha256 "fb3c47340dafe0da499409fbc17591ff1bfa145544722ff458509a401b2d9b1d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.12.0/imp-linux-arm64"
      sha256 "6cf4880bfb87b08da7cd1e95f8085fae14bc5cab7af274192303a844dafab79a"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.12.0/imp-linux-x64"
      sha256 "726d573639e427d4913252c9cca2a323577ce81e81a4c9ff69ea4af0015f6775"
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
