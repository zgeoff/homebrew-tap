class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.34.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.34.0/imp-darwin-arm64"
      sha256 "ade403c17af93909d99cc9ceaa85a122787ebb7ed6ac514463e629fbf5fe6ffb"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.34.0/imp-darwin-x64"
      sha256 "a83ba0cb17b89124ebd902c0298306c56958ee1ed2d99acaacfab29afd3f56a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.34.0/imp-linux-arm64"
      sha256 "6c39e545df4050e244545a40fc0cb5aab785a0a53f80430b5c23ea6b5ad069f4"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.34.0/imp-linux-x64"
      sha256 "a3fa3f10ce7cc12a4bfcf2e5ce56b67cee34f683c7e1b8fbc8e34742c68ffbbc"
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
