class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.25.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.25.1/imp-darwin-arm64"
      sha256 "806474d632575289d7db07f0d9079ca1cf4f90c608c92e11bd5a1231b31bb5b9"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.25.1/imp-darwin-x64"
      sha256 "e46509217264e3f74c71a63f82034aeb99b6dc48a73b9dfcbb6506ab93fccd09"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.25.1/imp-linux-arm64"
      sha256 "33e4455e954eae7500160623cfdfa8f5863de00507b9042d79b87cba4eb088f9"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.25.1/imp-linux-x64"
      sha256 "13bdcf9c756f4d968721d6aab032da652ff6751011e97bcee1ae581d09019008"
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
