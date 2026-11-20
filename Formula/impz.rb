class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "7.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v7.6.1/impz-darwin-arm64"
      sha256 "b77e8e4f515b089d0b00c488b22e77a56f3e999fb5e8acaade5c3541e8996a95"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v7.6.1/impz-darwin-x64"
      sha256 "d67e0b8723a2a0e9a6606e730531eb5b90e8e0a34c29835d0115a083f37a855f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v7.6.1/impz-linux-arm64"
      sha256 "434870fa902ecc47be74405670740cafd13ce873b02746afe175ea369d8ef05c"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v7.6.1/impz-linux-x64"
      sha256 "a5b52d8988a0ca03894dc32af41e3ac9aaa6154e352d825d9d375a9f2c530c11"
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
