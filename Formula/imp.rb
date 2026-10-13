class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "1.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.0.3/imp-darwin-arm64"
      sha256 "f2b2c587fb34dbe44465881145dc8f78841725fe35918945ccd3167c43de2d3d"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.0.3/imp-darwin-x64"
      sha256 "5f6871d6be9d0875acfe3ab51fd76d456c1a9e3bc1f55a0831ff2237dac6a1f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.0.3/imp-linux-arm64"
      sha256 "907282f43fac627387bb7201b6b6f0ad1b308036ba1d77e8d30fefba2e1e0043"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.0.3/imp-linux-x64"
      sha256 "e42e8e83e9e9ddd9123c87da5ece6d3192cc554bd9e1ceabe83bd98380bcb2a1"
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
