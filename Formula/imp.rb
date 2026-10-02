class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.17.0/imp-darwin-arm64"
      sha256 "8844bb51fc5fcddbe080748cd95e92e4aa792d37d89657ee84b8cf30931bb019"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.17.0/imp-darwin-x64"
      sha256 "fb6cab4d16cf49d5de4ad5057b144f3e48cc153d5e8e249768be67067c8f439c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.17.0/imp-linux-arm64"
      sha256 "d6cb1c857e555d6d40cd0931f63345a8303d8d67ea02ca791e86aa0e2cd39d03"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.17.0/imp-linux-x64"
      sha256 "4d64836c3cc4f6215fb004bc5572b0d2d8f01f73fe449780a36837af00bd5e6c"
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
