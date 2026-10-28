class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.0.2/impz-darwin-arm64"
      sha256 "2ecad518b0be10e3f6d59c6b7133385a503561a9c2a03c4cbc03e6eaae62545d"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.0.2/impz-darwin-x64"
      sha256 "35f52e9211e8855f7c81b74c6a8f4d6c4b583da6e4b9e9621243d7901af9689c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.0.2/impz-linux-arm64"
      sha256 "dac34a09432dc048a9dd0eb00350bdee14e4ba3b1098141f9df3cbeddc47c628"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.0.2/impz-linux-x64"
      sha256 "01580a9393800e12be6e2d36f531be74e7a87a342926e240a3fcb1625c5fbce8"
    end
  end

  def install
    # a bare download may arrive without +x, and the completions below run
    # the binary before Homebrew fixes modes
    binary = Dir["impz-*"].first
    chmod 0755, binary
    bin.install binary => "impz"
    generate_completions_from_executable(bin/"impz", "completion")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/impz --version").strip
  end
end
