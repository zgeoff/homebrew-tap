class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.40.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.40.2/imp-darwin-arm64"
      sha256 "227a3366a5e94a538f77e4697c70209956b4e0d387a8448cd778059c7a456862"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.40.2/imp-darwin-x64"
      sha256 "0385d43e8e25ed5109a62c130525341fd6e4a584ccbda2b7fbcc667d32a0e60f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.40.2/imp-linux-arm64"
      sha256 "03318369175af8fab9b24d89b4bf11455b9ff204aec8f1de6900f5114be4dbde"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.40.2/imp-linux-x64"
      sha256 "e751923cc1b516177861b7a6a0ed8539096dbb264e312efa38ac045f1e060c05"
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
