class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.0/impz-darwin-arm64"
      sha256 "34bc97e74f25b9daf576315e65f59002bbbfa8b081c5c7eb75541df7b42bf944"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.0/impz-darwin-x64"
      sha256 "7f2cdc4140efc075efba7bda33a38f93a52cfe11103ff526c6d8314eee06a7d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.0/impz-linux-arm64"
      sha256 "d6e54aa2e92ca46bb94eeb38287943cf12964af74f4692bd0b204cf47e1296b1"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.0/impz-linux-x64"
      sha256 "7ec501eee25381b16220dd02eb179a145b25fa18201978d81c241f2835b546ea"
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
