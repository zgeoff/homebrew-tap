class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.22.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.22.0/imp-darwin-arm64"
      sha256 "bb1350b9c3a2d98b0e2cde2684233bbbf648182eba15b99af60393753ee9ad2c"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.22.0/imp-darwin-x64"
      sha256 "c8d6e86aaa0de0ec8287c73409c670533e1000b3f31096408b40c632ff40a76c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.22.0/imp-linux-arm64"
      sha256 "32964445905272141ae604d3a5cc7cf24c32b034eefca37bf3a13338148ad7fb"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.22.0/imp-linux-x64"
      sha256 "11ff833bcc42f15a245c32dccc69107befbabafdd895722ccb825d8a8d3a98b1"
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
