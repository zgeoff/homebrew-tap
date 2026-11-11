class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.11.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.6/impz-darwin-arm64"
      sha256 "3b869b74fbeb22e2a7c27e11b18c8ca512bafc28b0c7596ee570d068be476699"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.6/impz-darwin-x64"
      sha256 "626f2e139b4cd5843673c5a3650855dc0b7d0fe2d3baa649823278518dc5bec8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.6/impz-linux-arm64"
      sha256 "82463a182fce0f9042600fffc3039b52b165e20fbd0d847e76dfa0a849bd30e0"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.6/impz-linux-x64"
      sha256 "6c0df9199eb5a66c5f50df27aa8933afcc727ab4f8d8d451bf40f0429c1662d8"
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
