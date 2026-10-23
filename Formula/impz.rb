class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.10.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.4/impz-darwin-arm64"
      sha256 "43114f695123dfb559aaed38cdd016f87f1e0ebe5aba699e6b39bc07bc007512"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.4/impz-darwin-x64"
      sha256 "06a8db225eab84bf2637038ec94966cde331a0c1a34529d984060c3ec548191a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.4/impz-linux-arm64"
      sha256 "a4e9d03bc1a3c7eff16eba910fd100b3b9e08abb5dee61987caba44c3f6cd456"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.4/impz-linux-x64"
      sha256 "043f7ef3d533e11c8f5179427ac7f820510c0b1a84054a466a0eeb1763bd4b99"
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
