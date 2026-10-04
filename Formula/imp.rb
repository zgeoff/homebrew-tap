class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.29.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.29.1/imp-darwin-arm64"
      sha256 "a5c832325391a22192c9cf054bc7992f884c836a8188a284e613c1ac6b95e64e"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.29.1/imp-darwin-x64"
      sha256 "c736e6605cb75b09a7982a99bbb9f629aefeecec744f7d82b07911d65ad36361"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.29.1/imp-linux-arm64"
      sha256 "0e867cace3aa187e72838f2a5db53eb193509dcfb67f9fcf0d3ab0d152c3581a"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.29.1/imp-linux-x64"
      sha256 "db1939920858beae5835f622cff7591ca9ab16fc6d4d5baae48b92aca99badc5"
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
