class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "4.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v4.2.0/impz-darwin-arm64"
      sha256 "d5a29c5ac15f4c47901e7e8f17683b10748fe8eb90b5386375b35dbe2eff7d43"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v4.2.0/impz-darwin-x64"
      sha256 "435163819c4d9c3ed0f0bd8208904720501d7a502445432b85c3378bb0cc61ad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v4.2.0/impz-linux-arm64"
      sha256 "5454399dae1982e7bf5718533efd2c1c9276a640b7adc282a8c02f4145509684"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v4.2.0/impz-linux-x64"
      sha256 "d25944bec7d356ea5a621517c58f0d7f484add220ceed9e7ad9d3eecee9851f1"
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
