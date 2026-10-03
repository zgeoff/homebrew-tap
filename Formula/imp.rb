class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.26.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.26.0/imp-darwin-arm64"
      sha256 "0a5c004146c6cf4529d324cf3adfb5f9e96cd197eb59ba31567b35028c4696dd"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.26.0/imp-darwin-x64"
      sha256 "f4a4d856c909c24fde033b38fa9cbb7893f5545cd5f06f2d13ac5c5be656cbee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.26.0/imp-linux-arm64"
      sha256 "9fed852dadfe5c7954d045edb3a264f80a1042c41a2b9a4e0eb814060efa329a"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.26.0/imp-linux-x64"
      sha256 "9de753253949443fcf39abf188878948f721f7a571a835df7a3f57b747bb3350"
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
