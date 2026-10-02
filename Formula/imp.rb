class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.21.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.21.0/imp-darwin-arm64"
      sha256 "e33c69b7df224955bf58e2a9ace9cc992367de4719b00f4847e619e26d7f24bc"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.21.0/imp-darwin-x64"
      sha256 "6c6425604168949d525f31b974ea8542dc7f871a307bcd6a75f96d6e76ce8d63"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.21.0/imp-linux-arm64"
      sha256 "3c53a2517da486783554264501a611d5eb698caf1f9cfbaa667ea353f25b692d"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.21.0/imp-linux-x64"
      sha256 "406de7fc19d61a05db95763256b599130d709e6c2fc6c45f57826c07a0ba5f9c"
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
