class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.2.2/imp-darwin-arm64"
      sha256 "15a06fa31bd51ff63e14ca9220a54e973c472b92bf0954a10567888891ea4b40"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.2.2/imp-darwin-x64"
      sha256 "52bb9a61960931feb3e9db91ed905cd2dff10f027a4abde2e3010732130c2c33"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.2.2/imp-linux-arm64"
      sha256 "fce445838a01ff3e9ffee1c088148a84902e8a9ff6d583ba506cab8935a46e68"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.2.2/imp-linux-x64"
      sha256 "d75e2d002183e448b2b5117ffcc254c5d7be465bae889b98ae6d4af48f1b810b"
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
