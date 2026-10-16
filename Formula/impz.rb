class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.2.1/impz-darwin-arm64"
      sha256 "1c4e43a7b314f88f6d4433181bd2605b80a139caab4a8a5dc64cb9e2f3244a6b"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.2.1/impz-darwin-x64"
      sha256 "8c26fc6de2180c2b7fa8e010919fe177f1d9aca8b5ce1006cd86a932eeee63b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.2.1/impz-linux-arm64"
      sha256 "dec59c86945e5396c1362cdb1ce82ebae0297a82cae92cb430ff708c8cd34d18"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.2.1/impz-linux-x64"
      sha256 "e50577b5ac08098356fad18bb2f0bd0f99b3a4d7142bfc1f708a65709b555211"
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
