class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "7.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v7.8.1/impz-darwin-arm64"
      sha256 "85c88bebf01aac9882f21104ca9d1ecfc1f09984925e143e0dcaf40fcd0542da"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v7.8.1/impz-darwin-x64"
      sha256 "c10f5ae119af6a7f0b06bad7a2752bcb815f0739d79da95f84f05988802b9332"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v7.8.1/impz-linux-arm64"
      sha256 "7a5f495f58b173f320ad480ac82b971654ce892796d541b26803d87d7b8846c3"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v7.8.1/impz-linux-x64"
      sha256 "09210de7cae3ca154c9fa1472c6a01dad398e874b45deb362673465d86346e37"
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
