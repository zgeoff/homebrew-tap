class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "4.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v4.2.3/impz-darwin-arm64"
      sha256 "bc81b101c1eb7bd3bd340c1af58212f7c3336806dfe2413b690ede03154c4806"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v4.2.3/impz-darwin-x64"
      sha256 "cc6aaf715db9d3469507547e2d4ee76163e8c05ce6ff21a0c67947b5af76a625"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v4.2.3/impz-linux-arm64"
      sha256 "f9deaa59fefb861241588ac3b96c0fb8d033d16046203644575b915ca5dc4ea3"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v4.2.3/impz-linux-x64"
      sha256 "ea8cd772823109da0739bedfdead91fe09300c9b02b958398df050db55bf2a30"
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
