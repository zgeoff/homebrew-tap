class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.11.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.4/impz-darwin-arm64"
      sha256 "bde1244c32ba36fcd84ee026360c5d28cd09b917a67b1130796f85199c1af957"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.4/impz-darwin-x64"
      sha256 "f80f3e21d82861d1011872a9c757c704282c8dedac42e906e6d521f6ae425238"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.4/impz-linux-arm64"
      sha256 "d5684013a0d911e340964d7c7bfe8cfaa67b5ed61225912616c7df56b6bbace6"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.4/impz-linux-x64"
      sha256 "f0f2b2528542af60abb94e13b268291475ea211fb70c8612d404ef4f8c0c373e"
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
