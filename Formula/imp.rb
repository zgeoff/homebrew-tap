class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.26.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.26.1/imp-darwin-arm64"
      sha256 "9ee3e3916f064253f20d5b80024c717f11da53df1a2b3e989243c5027ec5e2cb"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.26.1/imp-darwin-x64"
      sha256 "8cbea3118a25b541dbc9aa66e8fcd380d22d8fb34f13be0cbf7179a11e5c7d13"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.26.1/imp-linux-arm64"
      sha256 "93ba5a4c630f4cf9d483c84ecbdde4f778762136165aca2f5e06d904eabb2512"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.26.1/imp-linux-x64"
      sha256 "c6f37dc83da2e1892cfd74467087fb242de738c495aee7b84d433afb9134d4e8"
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
