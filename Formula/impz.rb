class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "4.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v4.2.2/impz-darwin-arm64"
      sha256 "55d3e4dba0da78780d681589c89f93ff4a8d82fa7f124d433342d64cac14e966"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v4.2.2/impz-darwin-x64"
      sha256 "2f82bab577ccb86d37f9df14534baf320297f25992b5e80c4496713c73de19df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v4.2.2/impz-linux-arm64"
      sha256 "8f69624fd92a8a02ffc7c260701a00740dfd3addc8908b0c8112f7367992f99c"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v4.2.2/impz-linux-x64"
      sha256 "3f4ac7740289bdfc3791b89797345dd5855fa1e0c363b518f71fea1877d7068f"
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
