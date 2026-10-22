class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.10.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.2/impz-darwin-arm64"
      sha256 "841b046fd01e6b04c894fbed0b0e150a514cfe7d7854df5af903e20985f561e5"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.2/impz-darwin-x64"
      sha256 "9d3e24a3f71a2f466ae2a3a282f89458cf51c8778a7a43ec04b5466b2f84e8ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.2/impz-linux-arm64"
      sha256 "09bd81043971a87aa7ba4a6b4340da3c4714e312bb40b12e6903b01a4c2f9572"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.2/impz-linux-x64"
      sha256 "c49fee4cdbb81c00b63da0a1f3934812a1ea4cb746b838ca2929752499828b37"
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
