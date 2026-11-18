class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "7.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v7.4.0/impz-darwin-arm64"
      sha256 "10e19297ecf286a48790f8a055541f96ba9fc7547e8c663f23a00a8e3161590f"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v7.4.0/impz-darwin-x64"
      sha256 "ce2b9889962c9e653f37609a6d77d85d8cc2b0d2407f4285e24d84006da65671"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v7.4.0/impz-linux-arm64"
      sha256 "6837335fc008ce5ba26d81b37ccc465dc29640ed35d3911cfe5b569823d61a92"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v7.4.0/impz-linux-x64"
      sha256 "d447e749350f9b3f53319dde4cc1f7000351e70ccf9f40e133c7a96db9660e4c"
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
