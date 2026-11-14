class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "7.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v7.0.1/impz-darwin-arm64"
      sha256 "0c2b14c19a5860042f9edeb2deb66f904e9ef6ec298530f80ef26772924ce7c2"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v7.0.1/impz-darwin-x64"
      sha256 "14e34d774463909c6b22a8763ef26b50c13865ead0ad05b42130ca9f5c750ae9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v7.0.1/impz-linux-arm64"
      sha256 "5c80a30c8a0efefc6f932a1801aafba153251b486b7199c98d47d69ab08939dc"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v7.0.1/impz-linux-x64"
      sha256 "8c6cb931f6dfa335b2fe13417799b1581041c6f88ffb53ca540a4e16a2ba3a2b"
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
