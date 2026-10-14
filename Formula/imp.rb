class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.1.0/imp-darwin-arm64"
      sha256 "5ed799e75a2588ec2f5d42278f30066aa2ed898023e607a95f84ac2a6fb1afec"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.1.0/imp-darwin-x64"
      sha256 "544eb11065a53e8c642f4cf67b7ac966f94271167815742d8446f3fea003fce4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.1.0/imp-linux-arm64"
      sha256 "03e3b05e0220e282f2a72e029ed2daea13e4ca192cfe4320afb9904f597f243f"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.1.0/imp-linux-x64"
      sha256 "ad14d2d453b0fff84099b2b111f76227ba6ffca41f1857b0ff8862d689580133"
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
