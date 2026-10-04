class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.32.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.32.0/imp-darwin-arm64"
      sha256 "3dcb74cc5147d3d32359b35ada732a8f440ccb8edf4848ec1bb65180bd5c8a66"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.32.0/imp-darwin-x64"
      sha256 "28726db1e0f8618a48152b3623ecbebe240b26300bfeb3d8ba09b0004d238fdc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.32.0/imp-linux-arm64"
      sha256 "7eecfe4f48f03b4d84a2b240acc95ff296a39296fe6e91f5ef667a6f9ba395ce"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.32.0/imp-linux-x64"
      sha256 "26ac647c9d1d758f555784de5be47d18be3ed22eb956e905b7406ee8da47aaee"
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
