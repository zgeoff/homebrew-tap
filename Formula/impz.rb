class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.2/impz-darwin-arm64"
      sha256 "4201987b900500433cde5f667242c25e8faa3650d67fa799d4061c8a864cf4ed"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.2/impz-darwin-x64"
      sha256 "142711474654f36539ba3282909e83b66182fe62faf4eddd7b276a8866e3ab1c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.2/impz-linux-arm64"
      sha256 "87d5149f07b86838b9f3f1152ddcb7ca2a4dd731b65b009724325a0df2d3fe51"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.2/impz-linux-x64"
      sha256 "e2539319b994040b90b5e8b20892d469ef376fa21687d1993f23343e1d017800"
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
