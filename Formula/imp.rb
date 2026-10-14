class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "1.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.4.0/imp-darwin-arm64"
      sha256 "a84d2ed49604e8cf110b78f7e9332007a2e13fde3ce27ddf0cea3b173c4aa556"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.4.0/imp-darwin-x64"
      sha256 "9ca12f259b5201b8d67cfc89cea60f92140613066b741abf51923411071442b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.4.0/imp-linux-arm64"
      sha256 "3abce515a231164b0b2165cd6d369dba164298b7c4a44190ebbe95ef638b7151"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.4.0/imp-linux-x64"
      sha256 "8215007a5a8d14a40a5a91b1beb7096f4d46c082f5ced7d3eb1107d2b5d85bcd"
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
