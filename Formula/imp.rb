class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.0.0/imp-darwin-arm64"
      sha256 "e3d7bf66939c81caf40694d18e2794f9cab1e80fa286b59c75c9a9e0a04d108a"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.0.0/imp-darwin-x64"
      sha256 "174a83f68628e4093e1ada75382275ed052484e67d03ade9e9d7b077fa0b6bd5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.0.0/imp-linux-arm64"
      sha256 "9c720f7a53c83ba32fcb90dded499b14f9bbc156c53ece0ffd1f1ac25a942adc"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.0.0/imp-linux-x64"
      sha256 "6e3fd78d261e9d1abd51096346c97f9e0eca602a2d9002046ff8777ab935bde7"
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
