class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.3.2/impz-darwin-arm64"
      sha256 "1433f8b097fbf0f758d7b71d6b2fec7071004b5678ee24667459defc50cecce2"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.3.2/impz-darwin-x64"
      sha256 "ac02ecb7bdf55a5b1366bfa7fd9d7f89505ad16ba54879da772c9ad9271eb312"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.3.2/impz-linux-arm64"
      sha256 "26f9cd94ce456f63a0ebc43f19f24da3ee0585b7fc55bcd75bd9b10decc6e3ee"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.3.2/impz-linux-x64"
      sha256 "0dc20643af3dab09aae62c0bb16cc7a3c6b79745404d21d32c3d43f633b4dd59"
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
