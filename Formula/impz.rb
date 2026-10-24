class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "4.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v4.1.0/impz-darwin-arm64"
      sha256 "79740910d36abf335dfbe1a269eec45245104d81667f13606a1ff3cd64ea9340"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v4.1.0/impz-darwin-x64"
      sha256 "7b26c28309a172d75167f6a576b23eb8922efba04a595d6f67670ba5fc6d3e43"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v4.1.0/impz-linux-arm64"
      sha256 "c52c055ef22eb2bea7f56818d22cf5bd4e304c7ce5ddea150995d19f8ba06a17"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v4.1.0/impz-linux-x64"
      sha256 "01a302d19d284f48f486bb43bc4059c7e88181ce0a671a7922ce857c63c8d1b1"
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
