class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.40.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.40.0/imp-darwin-arm64"
      sha256 "6a2dfd143d90321b53f27d51381fcbd95b0cf1acd6121bd341a83aacb48ed61b"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.40.0/imp-darwin-x64"
      sha256 "75a9bd236d0ca93b04de6b4ee1e497de1ca9fa71fd172d15efa9c64376b23260"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.40.0/imp-linux-arm64"
      sha256 "53df26dc155310ef430df129b4f451b8d7c361f537009adf02b4e55d61643016"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.40.0/imp-linux-x64"
      sha256 "b4c2d7c3618f7c64162e497635b4d850a657996e3d5965cd8f4103235867fd4b"
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
