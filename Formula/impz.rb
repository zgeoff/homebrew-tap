class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.10.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.6/impz-darwin-arm64"
      sha256 "348fb8d11d7c217b25af24ad7d57525fb2f3fa834dd4b0954edb76ae7db8c484"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.6/impz-darwin-x64"
      sha256 "b34b96bc13fbe9c5bf4c7c08e05198a0ccc06120d4f0547fc89233b016341a01"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.6/impz-linux-arm64"
      sha256 "3abeed5753f7ae0127c9603e557560393a4cc6e2c5c1834a955a3e6b5670e1b3"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.6/impz-linux-x64"
      sha256 "4bb3faf1893919d3e0c8ad3f814df9e216135d02d04fef09466147c5ae8dbfdc"
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
