class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.40.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.40.1/imp-darwin-arm64"
      sha256 "930a7aa9bc8678db1c8dad1d25b3a95f94f7d1b23f13c2f47e6397621e0138d2"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.40.1/imp-darwin-x64"
      sha256 "6d9f886fb0a08312d58b6d0ea4e77faeb89fc11d1c2d5ac1c2a992e32b2f84dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.40.1/imp-linux-arm64"
      sha256 "08522b20f5b793b455c8e38c7e3fa4edc167b80027ee043537b9857fa0b00147"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.40.1/imp-linux-x64"
      sha256 "977d7ed70c40cb476163d5b6961439104104aa3097e65c2ee9ff218dc1d3ddb0"
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
