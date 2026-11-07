class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.8.1/impz-darwin-arm64"
      sha256 "5962cbf0f5b382e6befc290656e86b36c5a2a08e7e22c1b570d2d2fc4009c56f"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.8.1/impz-darwin-x64"
      sha256 "62280a40093aa391ad320c1afe6075a45a3e90fe880d03dd70ed153e7be99033"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.8.1/impz-linux-arm64"
      sha256 "f721087dea31ef4f1c00de892b7216d50b5ba4138843693496f69a74f16029fa"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.8.1/impz-linux-x64"
      sha256 "7f82d88c8e24055ee0ba624bd2593ca7bfe09e4d66fdede38ef037eeddf42129"
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
