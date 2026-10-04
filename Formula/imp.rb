class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.32.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.32.1/imp-darwin-arm64"
      sha256 "3ffe5448ba578fc8cb0d3ef01ce46d87fc2eb8425e6da68e5995a7c1d073d180"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.32.1/imp-darwin-x64"
      sha256 "279b0d4e84e1e7eb3169f9f430d23924bbbc9fab6da0d97fa6579c51c2fd8330"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.32.1/imp-linux-arm64"
      sha256 "6d2ee38cb396efd8671d1ffe88e876f1c087dc1b67ed033eac4300a4385ec780"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.32.1/imp-linux-x64"
      sha256 "a1c8d5619fc47d8f4cc1ed502dba14f2be49ae5db94de091b564b9a5f944ee28"
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
