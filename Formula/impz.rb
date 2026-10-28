class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.0.1/impz-darwin-arm64"
      sha256 "6e2c4c27f6c27bc629b39f9fba83dff35e49c762f45ce5ff08ed7d0afdba2323"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.0.1/impz-darwin-x64"
      sha256 "5aa36a06627c7d71f6a369d8d819d04f06864c8d9342080da6552233466af450"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.0.1/impz-linux-arm64"
      sha256 "6394ecfc2b3bef743ed82521b7696371df3158b2b83ed7a6156bafbd7f418d2c"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.0.1/impz-linux-x64"
      sha256 "19c118fe7ccfb7516cb14c791ff89b9aa4f460a1d0c6ad7c192b85d8c9f7b329"
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
