class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.3.0/imp-darwin-arm64"
      sha256 "80ef3498ea1fb91f6102d62ec7384d85a234c2e4ed28eec22c2bd21adacdddde"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.3.0/imp-darwin-x64"
      sha256 "df549d796b5a53ae29a8c299ead21ed7cf70a9226767842241f23c430ff277a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.3.0/imp-linux-arm64"
      sha256 "7eb0363c71efe98076c48b3fd69c2906784e0cce82279dc4824cc674cd0dc241"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.3.0/imp-linux-x64"
      sha256 "4906a83a6e183b4f2dbee7dbfcd983d551d9488737cbcb08ab834597bb0b56fa"
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
