class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.12.0/impz-darwin-arm64"
      sha256 "88161246ded593dec36bcb94531143e4eb3288f4ea373ff719c30e0c4a6c5b7a"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.12.0/impz-darwin-x64"
      sha256 "1e74436a517a45a68bbe06f50a00e4cb2e7f10d38026cbe528820f459f56a7fd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.12.0/impz-linux-arm64"
      sha256 "a7196778ab408747572dd75550eef55903c02fbca7f6dd3d4033bb1228898e37"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.12.0/impz-linux-x64"
      sha256 "808879875f322b0aa0e3dc73f57ada1cf77a5c08bd295564983307c8faf36b93"
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
