class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.5.0/impz-darwin-arm64"
      sha256 "b2114a85f06a476539048be719e0f81a39c5eab566ce6ae17d1d207000ae9526"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.5.0/impz-darwin-x64"
      sha256 "35b895b2f1253a5ac1d1d0b024bad055fb28f81ff049b7e68da7f10d4db0e46a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.5.0/impz-linux-arm64"
      sha256 "08e38c6dd24ae8ef2895a5f220e034797e2c5799fc643a8756da3619ff29e412"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.5.0/impz-linux-x64"
      sha256 "3d16bf79b30945547b04e8cb7153bb5f4069e7e818f7a11a2ce7309e311d2340"
    end
  end

  def install
    # a bare download may arrive without +x, and the completions below run
    # the binary before Homebrew fixes modes
    binary = Dir["impz-*"].first
    chmod 0755, binary
    bin.install binary => "impz"
    generate_completions_from_executable(bin/"impz", "completion")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/impz --version").strip
  end
end
