class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.6.0/impz-darwin-arm64"
      sha256 "03a90ce80379163f87461287d2395e2307d8f0aba9dab5c2c6e968c111a5ff96"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.6.0/impz-darwin-x64"
      sha256 "fe0c0d04ce463c127141dc75e629b7b876942a442a322cbb343f5fc3ef9ba432"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.6.0/impz-linux-arm64"
      sha256 "2a3dc56aecc486e4ceaba3f1ad1e9bfc1b75aa8587fc592fe77767a0230db3f4"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.6.0/impz-linux-x64"
      sha256 "599e547b2683afd4b380718e8884127288c752565458637654ec5e150c782c7f"
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
