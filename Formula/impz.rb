class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.9.0/impz-darwin-arm64"
      sha256 "69b257c9436dd51e77dfb18646b72c9579bd37e9eb9c5c134d6238d88adbf39f"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.9.0/impz-darwin-x64"
      sha256 "0d56b58356eadaeb1f6682851a06765b9cc1d1423b8d94183307f0c2b1e69fb4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.9.0/impz-linux-arm64"
      sha256 "340ed55a5b0529df0e26495b0e51588342938138c4d7d67c86665bfc5b927d4f"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.9.0/impz-linux-x64"
      sha256 "4978402d4b573116b6e41cd6dc583a4653172610eac3e692448826f9824a1a03"
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
