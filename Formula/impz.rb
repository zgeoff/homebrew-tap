class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.7.0/impz-darwin-arm64"
      sha256 "12c89a6c4b013dbb04d8720cbfa28229dd0db3193adf372d904e5691dc6ebf08"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.7.0/impz-darwin-x64"
      sha256 "840f098de66d8167ac183ec3c917b4b7c0704e43223f3e99348bc3c6eb93a922"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.7.0/impz-linux-arm64"
      sha256 "1db11540c7262e31bc697e93efc2ecf53238ec34e440836abae1fb416180659b"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.7.0/impz-linux-x64"
      sha256 "314b838d98b3cf72dee11c5324cc9135fc4d1a2b51aff595c080d0e7a8cf1fa0"
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
