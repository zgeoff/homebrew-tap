class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "7.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v7.5.0/impz-darwin-arm64"
      sha256 "9a659ea6ab195545e069766de455399362dc34f53ae85499f55269cabcdd1086"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v7.5.0/impz-darwin-x64"
      sha256 "5b465c16acb5909bafe9898cd9847b538e5e3b9d07446cf29eb9aa198d11e34b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v7.5.0/impz-linux-arm64"
      sha256 "75bb8347755162ad84e47d3a8fec3d3e24e17d71b17762115ec9ee7c676eb154"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v7.5.0/impz-linux-x64"
      sha256 "9314b8f108ccf754a1e8e919127f44a7063f24a855fdc634f59e85ceb27bb4cf"
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
