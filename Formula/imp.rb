class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.28.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.28.0/imp-darwin-arm64"
      sha256 "953c20820ad326df1a3e2d6922880b771a860cfa3de94bfe1e59e207138b55c2"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.28.0/imp-darwin-x64"
      sha256 "3d936df6372a924fee7fba1de425fadf00f32e1b7581be55fd1492db04f2cdc4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.28.0/imp-linux-arm64"
      sha256 "b5200e6a10222c8ac6693a3e1637ada20248ef94346df8bd5efcf702734e9980"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.28.0/imp-linux-x64"
      sha256 "5c0b392697854834dafba9d4aa55f2aafa1b380261036ebaebe7def46c4a48a2"
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
