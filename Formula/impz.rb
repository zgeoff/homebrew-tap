class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.8.0/impz-darwin-arm64"
      sha256 "98d570b23e1b563194f8c76ef0b146c6b26ff726dcba04454384bd3a3a13afdd"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.8.0/impz-darwin-x64"
      sha256 "61810c5a709fa6a10778c6006d0f6f0c9713db8d9587bf1752677f74ed371af4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.8.0/impz-linux-arm64"
      sha256 "d8185e5ad386161680fb84c98436a4be9f63de57d679031a1c001eb5a16db438"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.8.0/impz-linux-x64"
      sha256 "755c8266834ccff2f31e4c5b9c746b19e403ea84047770c9684362227b000b79"
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
