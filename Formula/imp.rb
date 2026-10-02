class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.13.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.13.1/imp-darwin-arm64"
      sha256 "e4fd34a893ab60ddbee7ab5e191f0445e885f71ad2e4a2dbec699a1e8e8aa790"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.13.1/imp-darwin-x64"
      sha256 "c13ee8ff8b08ccbd62145c8d949cb6d7c334dd38a4cfd618d156c2e1c829e496"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.13.1/imp-linux-arm64"
      sha256 "89a56e21255e207d2730230c5e4b5ac996402b9b10b44d5aa0345ac2a4c21096"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.13.1/imp-linux-x64"
      sha256 "7145b2f12d993c56d55c1c5e98e121af0a76a000eda7ca24bb38b3d5b3d3a9cb"
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
