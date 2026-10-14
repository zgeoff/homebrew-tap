class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "1.4.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.4.4/imp-darwin-arm64"
      sha256 "25427495d6b252f99fe8d13703dac8c364bb5210d1013c5c564382578107b904"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.4.4/imp-darwin-x64"
      sha256 "7be64e9cdffb156a2ca425e128c7c1a7301d20f65309c974c612cce46140b25d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.4.4/imp-linux-arm64"
      sha256 "6586c4d6114f1bc34df8efd31cf54c536c82853123d049571e86465cbc99a81f"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.4.4/imp-linux-x64"
      sha256 "19e740ecef2018814a12eca2ab4db9f20f622c09b7b11ae6e1388c0ac2ae808a"
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
