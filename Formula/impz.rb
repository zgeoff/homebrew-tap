class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.9.1/impz-darwin-arm64"
      sha256 "5ae1bb4734bc7b5a5bb5747ffc1a29c5fae4fd9cfb3119b749d8d006b3560905"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.9.1/impz-darwin-x64"
      sha256 "66b5065328edefeb941d8ea93a899a086ea172643a355e5874461c5a822a2f88"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.9.1/impz-linux-arm64"
      sha256 "f66461017c1b0e70b3cc11073d8ecd389f9b2c0fcd082a5d5ab00b6d6891ac95"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.9.1/impz-linux-x64"
      sha256 "af880222fa03ff73eb5c32bec466ad1d85315df7510a2f5b88b61852654779e7"
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
