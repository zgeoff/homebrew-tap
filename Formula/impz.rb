class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.6.1/impz-darwin-arm64"
      sha256 "73f89b7a720786e4ac7d18a0d3033ca41b85bd3fc5964fa54fb5f11b1fa3255d"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.6.1/impz-darwin-x64"
      sha256 "f189f3b0ead517c2d2a58a2aae820acc87973c2ab6d15ffd4bf69a45550a33f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.6.1/impz-linux-arm64"
      sha256 "e58f8459e30fb5f3b7dd2696482df8b92f201f526c22733ec3dcc56dcfc0601d"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.6.1/impz-linux-x64"
      sha256 "0e138ba14b29f9117d96423cd3144bec358b1dc84a352f1491f4ecc7e1e9f485"
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
