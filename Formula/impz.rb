class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.5.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.5.5/impz-darwin-arm64"
      sha256 "28d70d68a81a26dad3b5938648ba0fef8527037b3cd99814426a450accf50d24"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.5.5/impz-darwin-x64"
      sha256 "ef600d929d5723f5b3d03966d1fc8bccf07ac6ddb6b6fe9957164059bddc0af3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.5.5/impz-linux-arm64"
      sha256 "035fb601248c53feca6fbd797459a62d8148468514cc5a0d3977861883f1d0d1"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.5.5/impz-linux-x64"
      sha256 "4ff60c1cb675ddd149a1d924882c0d20ee62aa580a80915565da115c0b160c62"
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
