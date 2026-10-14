class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "1.4.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.4.3/imp-darwin-arm64"
      sha256 "b354f6235735a18e5d8dc5b25ac32d772832ef19cad8ae6c84fcca030504d90d"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.4.3/imp-darwin-x64"
      sha256 "2d6b417bdec8deecf23ba893700071f54d591ec66247c0af23778cc267e1561b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.4.3/imp-linux-arm64"
      sha256 "a5a0e63fc80291f8e403914e96aca7fe413d6a57eb24a58fc7343b7ff23f6cdb"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.4.3/imp-linux-x64"
      sha256 "1c97bc575f4b533ca0ae34d24a5b64da37120090970e3e835098a29209e8b7ed"
    end
  end

  def install
    # a bare download may arrive without +x, and the completions below run
    # the binary before Homebrew fixes modes
    binary = Dir["imp-*"].first
    chmod 0755, binary
    bin.install binary => "imp"
    generate_completions_from_executable(bin/"imp", "completion")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/imp --version").strip
  end
end
