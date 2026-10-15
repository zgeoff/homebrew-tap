class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "1.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.5.1/imp-darwin-arm64"
      sha256 "43fd1d5cd0980d798b6c83f4f1068c319439e98e33bc9caea851dc138b5cf8b2"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.5.1/imp-darwin-x64"
      sha256 "845df0ad9449b2d7c85ef36d4e59d31ec50003970ce350e61d6a5fe597315d2f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.5.1/imp-linux-arm64"
      sha256 "2102e8c45ed040818e9e03f30f683f77155867731826e0c4346b1517c5988cea"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.5.1/imp-linux-x64"
      sha256 "8fbc696121f7f1020ba2a771be6992fdf829ec5f48fa0ca87079c6dc7a1dd5ab"
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
