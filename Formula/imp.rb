class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "1.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.0.4/imp-darwin-arm64"
      sha256 "f55fb238abd4324ce278721f5173f70f6b7ef96c0fab8bbec539b6059f09295f"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.0.4/imp-darwin-x64"
      sha256 "c1354cd71348ea3e507b30eb58bbb09bdac72ee4461ef1cd5f04f3eca671eb8c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.0.4/imp-linux-arm64"
      sha256 "c92cadb8b9eab46af6c9d2220af27ce6c561ee35736257d12f12fd4a8e20383a"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.0.4/imp-linux-x64"
      sha256 "4d99d96f174ecd00da3ed0ebbcbc95af1edbb9649bfebcbc0590f1254b53da48"
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
