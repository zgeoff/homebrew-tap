class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.26.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.26.2/imp-darwin-arm64"
      sha256 "f63275c5f608e51a500727540c9e45d5cc3cdab630c9267641d4adebbeccd884"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.26.2/imp-darwin-x64"
      sha256 "197da7f5a61c18d2f86e8b67cae6f37f7b3c47809c5dc7ba89ca541c4ed8159e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.26.2/imp-linux-arm64"
      sha256 "9b33f4398acad96bd162075d7ec69f50f5f7e0a2d6b160dc39dc0232bd75ab13"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.26.2/imp-linux-x64"
      sha256 "be798b490a331ba3dad8d8fc7b3a933b42b203b91413a68b5e3924c8d9c129b8"
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
