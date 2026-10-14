class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "1.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.4.1/imp-darwin-arm64"
      sha256 "b17e31a9bc42a140c8013dbed96a8348d347a6c132e130e1941db74849695806"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.4.1/imp-darwin-x64"
      sha256 "8fc07d8b549bdffa9be66d89c84dd353ae25309cbab02be6f541070b89e32265"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.4.1/imp-linux-arm64"
      sha256 "0d7f69eac29e10f654911f9008b5b25fceff7d698c8b41df28bc27f484e6300e"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.4.1/imp-linux-x64"
      sha256 "7dda6262867f819e45f5b15c581ec77fa56ff210a5c9e6e96e85e894cba15766"
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
