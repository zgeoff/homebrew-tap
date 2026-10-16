class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.3.0/impz-darwin-arm64"
      sha256 "fcea98f01f7e21a60ce6cbd1e70e655dcc50c13d637da2c8d44cf0094f5a8595"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.3.0/impz-darwin-x64"
      sha256 "421278d947970e918ca02ea14a9da0d665cf8b1e9eb2c3e8d946be1a8e74a867"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.3.0/impz-linux-arm64"
      sha256 "43dd770719f04ce3e5a3801cc8b461c13286a54e07d70b8c21ca66496856ec1d"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.3.0/impz-linux-x64"
      sha256 "f6f09b2f2c01d89424d74f66310f80d06634abb07e32adade32a93302562e631"
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
