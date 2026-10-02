class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.5.0/imp-darwin-arm64"
      sha256 "afcaf200730f8bacf0afc2fd339462cd1767abeda25b2693dd28960512526e88"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.5.0/imp-darwin-x64"
      sha256 "c9547d49a2ca64307af98a7b2965e607034c4eab7c581c3bbfcfeeb4dadab555"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.5.0/imp-linux-arm64"
      sha256 "1d18f210ebaac931c7103559664c2225c19f64c2418b714ae86d33f601a88038"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.5.0/imp-linux-x64"
      sha256 "8929f75119cf0a22cd9cfc615e76bacdb0519d51fc7d9fa86c82c2c931899e67"
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
