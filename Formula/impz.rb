class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.0/impz-darwin-arm64"
      sha256 "4377e419e3cbd295240a991bfcf41dc4057e12c74677a61f8068ac151badeb93"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.0/impz-darwin-x64"
      sha256 "20702cc081ac0337baa0a92f234e975b1050aedf76efe04b304af40dda6dfe1f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.0/impz-linux-arm64"
      sha256 "0cedff69121c64b7db38997b2e616ae69b71fe2e10a7cd8e7bab300a5f0a5c38"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.0/impz-linux-x64"
      sha256 "efb41bf3a41de57e92958ee9c29f1877a64d1026b8135a1cff42ae26b2093079"
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
