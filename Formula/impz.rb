class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "3.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v3.0.2/impz-darwin-arm64"
      sha256 "96543fad93a8c97b893622abd8e38ac8c88feebbaba33663d77db071528f3776"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v3.0.2/impz-darwin-x64"
      sha256 "d3eff36b61e77d4f4c094d99a69164d93bf7e3192cdfbbc94635f97ab97a3f3a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v3.0.2/impz-linux-arm64"
      sha256 "1906dbac4729e4a9a940a1b40b8750ee622c26f644d46229213c039821ff1d10"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v3.0.2/impz-linux-x64"
      sha256 "3b91bef17162672393581924a56a5218618d5426c3900c9a9ecb71e8762ebf60"
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
