class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.1.0/impz-darwin-arm64"
      sha256 "b8cf847dd8ca68b245577d45dc08fbc8986a8e40a2a37bc33be6a125a5fc079f"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.1.0/impz-darwin-x64"
      sha256 "a77047266be712e09d735bd44b5475f400ff686b99d728489c3adfae09c1d8de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.1.0/impz-linux-arm64"
      sha256 "78adf24631e184c5c593af55308c41e9f1a800787e933f7ac93b66ae5ce3076a"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.1.0/impz-linux-x64"
      sha256 "a2253033deefca648074cfe22e3d34f810fde94db217670d88690c5b2f19229b"
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
