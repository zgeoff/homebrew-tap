class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.0.0/impz-darwin-arm64"
      sha256 "03cf34ee2f5161f1d7a723ae9d5b6988146fa6faf553f05c916711942cf17022"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.0.0/impz-darwin-x64"
      sha256 "6d0362d54d54157d724dcfd8ce125202deedf2ec9ccb1109359c82eddbfc6aee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.0.0/impz-linux-arm64"
      sha256 "14ba8356a1db114c5560a7f28b8c85398d29c753859d9d8c95a7bf87a6e11337"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.0.0/impz-linux-x64"
      sha256 "2b6fb715be1a84c6b83fcb729012277d5d43903b29e19449ef33ef88adf6ff0e"
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
