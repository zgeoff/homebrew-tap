class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.23.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.23.0/imp-darwin-arm64"
      sha256 "a87119b424f5df2b53167cd8eb8725adbc80451c9574b3ce9f7790dcacf7076d"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.23.0/imp-darwin-x64"
      sha256 "542b9b8802e6252f01f5253ac6a492340d826eb2c414b9d4f4b11049ba7b459c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.23.0/imp-linux-arm64"
      sha256 "054101495fce8a49b50d64cfd27bfba83a51b3eb0dad5ae8024b5aabf2fc1df1"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.23.0/imp-linux-x64"
      sha256 "e8e56d963ce6ba665f557ef3767fa2580cff2754922932a1eac3b062c46105a5"
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
