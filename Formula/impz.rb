class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.5.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.5.3/impz-darwin-arm64"
      sha256 "2ec836eebeb97a7b9ac2497cc874735bb65452906bf8015c8ac6f7b349234a3d"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.5.3/impz-darwin-x64"
      sha256 "f99bbfe665f8682292a5502acbba39b2119b8f8493a52fa3e5041aa03a4557f5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.5.3/impz-linux-arm64"
      sha256 "20070de373ebe7cdab1b0ee810e69b9265f1764592206ee63f6bc97ee98b8667"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.5.3/impz-linux-x64"
      sha256 "a5fb07a9b66c0927874f829222fe25aca4cea854192caaa62d5e4ad749f14378"
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
