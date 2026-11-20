class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "7.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v7.6.0/impz-darwin-arm64"
      sha256 "2c8eb2dcda1281a3fb81b23969f352668d840af33ddc82ec91b35a370c2b9b43"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v7.6.0/impz-darwin-x64"
      sha256 "c3202ebf51457a5c35bdb156cc88a2794ad525e7b59f6f9caf2f488d78b3d52f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v7.6.0/impz-linux-arm64"
      sha256 "a52cee4f12faf496d10ab85da1d4cb2b0ce47150f221dd7dc0a36247db7fb472"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v7.6.0/impz-linux-x64"
      sha256 "48f420d23d0ae0d767ebea97231044c04f2299af32a85567fbcf075856707b26"
    end
  end

  def install
    # a bare download may arrive without +x, and the completions below run
    # the binary before Homebrew fixes modes
    binary = Dir["impz-*"].first
    chmod 0755, binary
    bin.install binary => "impz"
    generate_completions_from_executable(bin/"impz", "completion")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/impz --version").strip
  end
end
