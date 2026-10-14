class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "1.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.4.2/imp-darwin-arm64"
      sha256 "4d2ecba3ed0ac8ffaf0a08dea3d9e5760218124b0798eafbfb1827c6d097bd57"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.4.2/imp-darwin-x64"
      sha256 "15b668aa15209a78152b0542fb999a66531930764c28f4d5058639796e5eeea1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.4.2/imp-linux-arm64"
      sha256 "a4f830d10e67b4af9e44cac53c71371a4340f4c9b4f524d96e187e9c47a1338d"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.4.2/imp-linux-x64"
      sha256 "321df2fc4fecf9f6b2f50ed1862a6056bc50bfa4d3c52fb9c9d453d0e2928e60"
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
