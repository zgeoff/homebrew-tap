class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.7.0/imp-darwin-arm64"
      sha256 "4a62d2f429c10002d2f214130af4d7329fe3e262143f7b3ee98103a2d1113367"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.7.0/imp-darwin-x64"
      sha256 "b665577cf13f35b222fd07a17287e7d44163855e30edcbba347c423bd1a4235c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.7.0/imp-linux-arm64"
      sha256 "8135cb937ef4c845945480bcb98b82686a324da66666546b72e9b9039e6a16a3"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.7.0/imp-linux-x64"
      sha256 "589c9e899d02bf910bffce1be105fcca515bbbc52c67fa6c6a8c0c21dab1c180"
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
