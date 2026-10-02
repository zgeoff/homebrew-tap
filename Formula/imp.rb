class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.14.0/imp-darwin-arm64"
      sha256 "c0b42f5d94a0246d4bb4962c125b285a64e85053d6f02cbae71cd3df33196d99"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.14.0/imp-darwin-x64"
      sha256 "79677ffd72ad26bdd57258b40f56c12382f60e4c9c79bed9419bcc1aa1c9b408"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.14.0/imp-linux-arm64"
      sha256 "5f4076eab35b3fb4e9e0c5bd86b5a3deed0a8105da6b0a3464a5c74f6422836f"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.14.0/imp-linux-x64"
      sha256 "77490fe655a80e8fbd4b80a3f40bcd67d6bdc7e3430049db84a66fbc8809ff52"
    end
  end

  def install
    # a bare download may arrive without +x, and the completions below run
    # the binary before Homebrew fixes modes
    binary = Dir["imp-*"].first
    chmod 0755, binary
    bin.install binary => "imp"
    generate_completions_from_executable(bin/"imp", "completion")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/imp --version").strip
  end
end
