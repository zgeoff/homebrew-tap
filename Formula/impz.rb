class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "7.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v7.7.0/impz-darwin-arm64"
      sha256 "9e58cbed50fe6dd6c4d74b3883990380781eb1072a901f78f17952f8a42cc7e8"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v7.7.0/impz-darwin-x64"
      sha256 "5ae36888fa264c14b62ccf61bf787ab60e62384d35ac4f8a0bf85cca2d31943e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v7.7.0/impz-linux-arm64"
      sha256 "926e75713b735dc350cbc492d6ff6ad3f65a14fe755b287b0cdc06b4e7ae364f"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v7.7.0/impz-linux-x64"
      sha256 "dcda4ccb8967ae36892bf39b7493eb02a106af0441a2fa93ad2b10590fd16690"
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
