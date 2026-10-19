class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.7.0/impz-darwin-arm64"
      sha256 "d5bdc679322f61a127a856f0f67c6503b64b8bb5fabe2e5fa03a074189f10843"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.7.0/impz-darwin-x64"
      sha256 "3e702ab466ec7e7c092cc486098fcf1b3f11ac8056170d1bcc36325d73ae3256"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.7.0/impz-linux-arm64"
      sha256 "8a9ba1bd9e310c6e0ac9eaf304bcde107fbe2fcfa19d0e694d73781d5cea8908"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.7.0/impz-linux-x64"
      sha256 "b96ab794c9c83eb5680569884ced358f76be0f03d86a37e1243e672f80389dad"
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
