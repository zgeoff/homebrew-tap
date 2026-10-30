class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.2.0/impz-darwin-arm64"
      sha256 "a42a91cd098881ec544a6e5c136217a8da849a54289219d4bea5e127d22a4f5b"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.2.0/impz-darwin-x64"
      sha256 "876a76dbb2a8ac99ed582c7355234fe8b73f49f7028a5a6f3f44f429358534a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.2.0/impz-linux-arm64"
      sha256 "105f64f04ab8db244a48c675f9a88a1be97abe7e29e134b70558ce31c32c805c"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.2.0/impz-linux-x64"
      sha256 "d2a38e7179c82f1870afc651dc55db4459d6512e4fded6438af6f002f67e49ad"
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
