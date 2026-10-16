class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.0.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.6/impz-darwin-arm64"
      sha256 "f89aadea09acc3c4fbe2d0756b82412aa5cffb791a9c6d0e4a6756ff82e2eeaf"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.6/impz-darwin-x64"
      sha256 "1521807a970a5815f9b583cc2c9b9141b062a0d9f3a79eb3edb3ff1f39ac4c79"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.6/impz-linux-arm64"
      sha256 "2ab7f4f102d6019798145e9c94b5f2aec8a1a97fe630fe7dad22c26f5cd78847"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.6/impz-linux-x64"
      sha256 "b8bcc66e2b56b5f3ce9e9da128cbbe0c6ac144d7646a74821c88226fc8c701ab"
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
