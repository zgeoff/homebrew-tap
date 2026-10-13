class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "1.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.0.2/imp-darwin-arm64"
      sha256 "c479fbdcce6d044274feb144ee0b5474b75c1a7f0d6fb1d55155039466944a70"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.0.2/imp-darwin-x64"
      sha256 "b07aade702615e97cfa50eba13b20fcf75286a54c1759a33d23b878aab828e7e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.0.2/imp-linux-arm64"
      sha256 "f115cc150e7ad414190222f43c003a4bd839a349dd30e619adfb19947906064f"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.0.2/imp-linux-x64"
      sha256 "d2f6940b0722d0185ec3b445b346cd9965ca013f236c912cd233a37dae927c89"
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
