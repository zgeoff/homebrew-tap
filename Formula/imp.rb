class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.40.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.40.4/imp-darwin-arm64"
      sha256 "7289aaa513610dd55ff25c069640dc133a55332de113422eb03c90744279efc5"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.40.4/imp-darwin-x64"
      sha256 "2b566e6a66446002e488bd1d2ebf27db2395e6b702d754f04e9fdafa8cd38165"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.40.4/imp-linux-arm64"
      sha256 "92cf814a8a156337eae8765b4572722e931511d414a86ff4cec89dd370b2a054"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.40.4/imp-linux-x64"
      sha256 "5257a90e91cd0cfdb7d8d154e88ee7f0e29567ecaed31930b98cb8e31f6576b9"
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
