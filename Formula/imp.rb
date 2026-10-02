class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.1.1/imp-darwin-arm64"
      sha256 "fc25d09cad5456aaa672701230c894403afa1ddbd3f0c380982653842a513c47"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.1.1/imp-darwin-x64"
      sha256 "0d8de432d43f1915f2812eb53844a8f89026f17cfa9f0de7f38c3f4120e8e106"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.1.1/imp-linux-arm64"
      sha256 "af4766eb5709590b483005c4fd340619f6ff7e60ab2a9142ab388f6cea1935d7"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.1.1/imp-linux-x64"
      sha256 "b2b04d4f82e1fbdc95c366a9dc2a3d67ef77f530fb4cf06b196fd45cf2e33a5a"
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
