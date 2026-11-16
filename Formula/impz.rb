class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "7.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v7.3.0/impz-darwin-arm64"
      sha256 "6e018444062ffa0f6de2790fccc5700a2cd93c033945f304ed63143bed7dc53f"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v7.3.0/impz-darwin-x64"
      sha256 "0ab5ffabf9dec522c90d7d12a9a069b218f60f9a530ffe976edbb589b8c943cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v7.3.0/impz-linux-arm64"
      sha256 "dac74d1c16cd663cf6c3daddd9bf4e6ca520ad9af603eff0bb53b73a82256f54"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v7.3.0/impz-linux-x64"
      sha256 "4685a767c2b175ffbc55f9dcc2be054ef03d95c7367fa650f6efc56974cfb2a2"
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
