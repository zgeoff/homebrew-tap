class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.9.0/impz-darwin-arm64"
      sha256 "b10c428d752f4bd9215112d2cb9d4478967e841500717c03ab5b40c377249fe7"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.9.0/impz-darwin-x64"
      sha256 "2612e66f80ea2f93266cadcf751ed7d7958b7452cfaa9f95cc2040d16de23392"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.9.0/impz-linux-arm64"
      sha256 "57671b838d5f65a3eeae8533cadac2c3dae79b00b9ed70dab5ec8c0391d01b4b"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.9.0/impz-linux-x64"
      sha256 "792f0e3a664161f2be5bcdc0950741205f7143cb2ff03fada1e5773e4e6b1a09"
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
