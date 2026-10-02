class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.9.0/imp-darwin-arm64"
      sha256 "618b22d6cf84d647ba0b31d3b27af94aceededa209b8c84b7c266e416d4077ec"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.9.0/imp-darwin-x64"
      sha256 "1cf73e91c0b819f4677952f215a3392c8de0510b2644852a58cc75aa8a5d0f1e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.9.0/imp-linux-arm64"
      sha256 "7dd682c9cc504e9bb55781bc3045d6079d7d6d252385b6f615f9ef9d6355d653"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.9.0/imp-linux-x64"
      sha256 "e474be659b39c686f8fbd93630e7af7ffd8f6dc0fa33cc07409858a6983d2287"
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
