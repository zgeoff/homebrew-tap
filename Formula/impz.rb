class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "7.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v7.0.0/impz-darwin-arm64"
      sha256 "92803cfa62a96562fa3cbd2852d418ee8daaedf8ed6a5162f72ea83e7bba8638"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v7.0.0/impz-darwin-x64"
      sha256 "b2174700e030434d20f291bf6e55e4db8a6b9554989ed3f8a56f2fd965f0b8c2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v7.0.0/impz-linux-arm64"
      sha256 "d0d49f82a098db8282597cf11c9f1129fef7d20d2bd2c3c7da435a23b8c09faa"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v7.0.0/impz-linux-x64"
      sha256 "a7d62061761c146fa8d78348407ceebc0f965e44a559af5c5cf4b1802020802c"
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
