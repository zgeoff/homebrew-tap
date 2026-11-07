class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.10.0/impz-darwin-arm64"
      sha256 "baf856732059a75f8d4a48d62de2e2adf43f95b7abc8fdb1679e3368f683fe69"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.10.0/impz-darwin-x64"
      sha256 "34f700ae291ce7af563bc77d9bc585f4b2b59d96823a543a5bb18d9aa4957ef5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.10.0/impz-linux-arm64"
      sha256 "18705be6c2b4bccb8c1581f5ab96f7aadb33e3f7adaa0985b5c173ede5eb294b"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.10.0/impz-linux-x64"
      sha256 "3e5502ebd552f78f06d6cba40718ed536b1b8628eb3b7e1f293ab8d79a578d18"
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
