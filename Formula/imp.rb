class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.20.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.20.0/imp-darwin-arm64"
      sha256 "f0bf5de7dfe9f835d46ed893e477790b1c526c2d03ff6d17a11daf85d546e2ac"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.20.0/imp-darwin-x64"
      sha256 "1c824c3582aeb024eab0e03fc60c303a42b2c73b570b59921591fbe73ff36dc3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.20.0/imp-linux-arm64"
      sha256 "e7e9818966954d7c90d849a9ea68ebdb6444cf424bd7622ee7f6b71d88959b58"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.20.0/imp-linux-x64"
      sha256 "0983e41a9b00cbb9c1e4ef56d84d25fc1dec609bf1299f63efb4f334b7d5a95e"
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
