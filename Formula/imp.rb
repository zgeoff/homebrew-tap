class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.33.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.33.0/imp-darwin-arm64"
      sha256 "4c4dd66c6843de5c38640962a17e4afcfd3478a708f60ba33966b894718a9840"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.33.0/imp-darwin-x64"
      sha256 "e6f51464e06d27c137ecfc4b0a021f790a3e91546012ff8e798b59abeeb19dd8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.33.0/imp-linux-arm64"
      sha256 "043cb5bcd4c56bb32542d5509edd04100559673796ac18d41c17353f10377d0c"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.33.0/imp-linux-x64"
      sha256 "d5c61cf6cdfbf0b19279b007c69cbef73080327335a88d03841b865d937e2d99"
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
