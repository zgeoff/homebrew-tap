class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.38.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.38.1/imp-darwin-arm64"
      sha256 "5160b8d42f73e62aebb7fbf74789fdc4d11ac590eb980961d58f9afbe740c6d0"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.38.1/imp-darwin-x64"
      sha256 "3f656279abd885348adaf4970fade537a4e48c19040a6dbf7142052fd6d58d65"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.38.1/imp-linux-arm64"
      sha256 "0252bb04d7544887b1de0db08172cdd0638c2b0cd14f2bbd8ee7300724bf8ced"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.38.1/imp-linux-x64"
      sha256 "ba6b9e9c63f8eb364cda1a1cb2893849c2ee0d6ab1bc09acb57ecb9a29ca2f1e"
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
