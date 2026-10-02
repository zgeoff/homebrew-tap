class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.10.0/imp-darwin-arm64"
      sha256 "92c227e5070ac36f7917007a3dde199765e5d9041522c349ec9d7e23e48333a0"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.10.0/imp-darwin-x64"
      sha256 "9e2f4854b75076a57e966bc0c096e603359fed646ab72aa22aa28a017d08a8de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.10.0/imp-linux-arm64"
      sha256 "9437c49d86758e421596817381da8fc2b74ee795f99f901439469e74ecff843c"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.10.0/imp-linux-x64"
      sha256 "cdcd2dacbcd6f79ffcc19022ea0e15e7aae4d962e771ca84fe2468dc320f2f89"
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
