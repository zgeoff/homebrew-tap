class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.15.0/imp-darwin-arm64"
      sha256 "03c8df8619ab6a5a15c3b06c3604a2080bf54856ffc7e5d805c949000d6c5b79"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.15.0/imp-darwin-x64"
      sha256 "edaad24e4e9977e271d894c20df73424c157a14f3106b5fcf07408af15fdc238"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.15.0/imp-linux-arm64"
      sha256 "2d9594dd24a0eff2b161541695cbd1f0f51b58435c60b648bdea498eaed5fd8b"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.15.0/imp-linux-x64"
      sha256 "bf5f7fe4a8219d2d0e9149c5786cccaddefe3a21a30568345bd921e5a2a75ef6"
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
