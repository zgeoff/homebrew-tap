class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.18.0/imp-darwin-arm64"
      sha256 "d761a9a159c9eaf8500d01b988d38281a7bff91fb27d25017f6537140cc99e38"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.18.0/imp-darwin-x64"
      sha256 "a8643d803f87b78fe7c0c88acafc8c4e4e9ed8422ed69f6b0d026f20162d0b6b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.18.0/imp-linux-arm64"
      sha256 "27d283a8a7ad2cfad92a5bea0a3f142b01e3b996f67ae2bcce04bf7c361ca214"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.18.0/imp-linux-x64"
      sha256 "1194f47d93bc8ce6eac93ff989f4f764ac40dde4840e84bc36c48d11c8da95d6"
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
