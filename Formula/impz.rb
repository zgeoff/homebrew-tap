class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.11.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.1/impz-darwin-arm64"
      sha256 "33f6dc18c84433c2f2eceadc89d9db59476ed63a279bf33ced80e4d94a336910"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.1/impz-darwin-x64"
      sha256 "ca48e7c4de563dca6aeca4c7631be1567ebd50d562def95d137ded2e79ba1945"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.1/impz-linux-arm64"
      sha256 "9cfff9726b603e003724b00c46f60c17fe0572906ab68aca3af8615d94aad5db"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.1/impz-linux-x64"
      sha256 "854c6f89b61e13ed41caef2c91e5f2926cbf0e2dc0eafaf26d2c9cad691a2254"
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
