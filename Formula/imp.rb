class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.2.0/imp-darwin-arm64"
      sha256 "c7da549350326d69cfca2f731033aea36490a37b498b8df2dfcadd96a5fe4af6"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.2.0/imp-darwin-x64"
      sha256 "c2f101da3a627300e45a289d71393a2fc52b94c85b5092e542d14a2db36efc0f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.2.0/imp-linux-arm64"
      sha256 "30cdca756ef38a10506e9bea9a129d12ec7a8415ea345eb2237523811654f766"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.2.0/imp-linux-x64"
      sha256 "f5fb691d6f73223231ad061bac972ef5c1101f6b59d235e50eef33d2fd63543f"
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
