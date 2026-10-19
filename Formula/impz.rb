class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.6.0/impz-darwin-arm64"
      sha256 "61725d8ed87c3c5ff505758a5dd44f2d50aee790b761007e7f7aca2690fca06e"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.6.0/impz-darwin-x64"
      sha256 "e4c331e7e9f256076293256455ab7a8f6c52949cdefa343c7d4eb4af9222f75b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.6.0/impz-linux-arm64"
      sha256 "8918422e9f122623ef23df2a9c4e790d90d40afcc94a1a999c889dddc9a9eba4"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.6.0/impz-linux-x64"
      sha256 "cc63cb699a65b4acee96ff7d3ac4b525d72041adc2cfcaa2d949a8143437aaec"
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
