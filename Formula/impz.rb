class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.0/impz-darwin-arm64"
      sha256 "4bfc91af003aa00a81a495951393224c7c013a59813edbf6f2189de493f6830c"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.0/impz-darwin-x64"
      sha256 "fdbb28d5e333953a1c1d9dea6b7e232c78744b05e65698a4cae5b57dae49e833"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.0/impz-linux-arm64"
      sha256 "9f4a057e9c34d6cbadddda48a57b0f236eacb18db83aafc5bcd05963b0e3a25e"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.0/impz-linux-x64"
      sha256 "e49e30c4571df3f5aa4371cab15fea78c2fe674f7c70c57983864bc4d7b8496d"
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
