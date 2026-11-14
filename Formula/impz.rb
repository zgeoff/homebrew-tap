class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "7.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v7.1.0/impz-darwin-arm64"
      sha256 "2e698f6bf6228c33a485a66cb24a1ee4834354670ba19912759ca28678738509"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v7.1.0/impz-darwin-x64"
      sha256 "2143ee8d5ca030ec5662b471e56ff025fe11fb2da3ee1c689528419c8d7b0886"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v7.1.0/impz-linux-arm64"
      sha256 "96283ff998800d45268b7875fbfc2f835b70600897f4c156f740747fe0e4aee3"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v7.1.0/impz-linux-x64"
      sha256 "33a7caf239c179092b69e911b86cb6fd768215a6aacb7181ee7068aaaafc51c7"
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
