class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.32.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.32.2/imp-darwin-arm64"
      sha256 "0172c8e4d924f18ec80a4a199b7b2dc15d188dba29c18699aac359a574d268f8"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.32.2/imp-darwin-x64"
      sha256 "ffb4685eae74e6b3efec6de8543e0f17a696b6892fad0847bb9ae42049646a46"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.32.2/imp-linux-arm64"
      sha256 "c5fcdbebe005d0cf732c323ede26a0b972846f5ac64d939d24a5c0e4ca69e2c6"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.32.2/imp-linux-x64"
      sha256 "4656dffd4a000dd4c018fbeb4ab8c3055fabc658dd50f7b433edbc776908eec9"
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
