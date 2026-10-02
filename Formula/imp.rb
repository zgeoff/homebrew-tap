class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.8.0/imp-darwin-arm64"
      sha256 "f657fe28e39320b26937d715bab8ac674dba8b88fc6a602373ede8022bccfc34"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.8.0/imp-darwin-x64"
      sha256 "2be42a961419b0207fd419f4a33e8f8bbb3ee325d8e930d58684111f41dced1a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.8.0/imp-linux-arm64"
      sha256 "4cae8abab37936d45016a17075568894fb258759b79fc3b5fb9eecc5ed7d89c3"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.8.0/imp-linux-x64"
      sha256 "0cc84780d0e19bb05f5fcbcba88ea849788f73e62ded4f570961494bf557de1b"
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
