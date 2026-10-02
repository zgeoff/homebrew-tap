class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.13.0/imp-darwin-arm64"
      sha256 "6eedcd5e268788fd21b56cdca0725cde94b864e718c9e4d85b2d9f08458cb5b7"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.13.0/imp-darwin-x64"
      sha256 "97fe28d78039522a32fb78de86d405bd5b3cd66f2186678f985b8056571fc6f7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.13.0/imp-linux-arm64"
      sha256 "ad0862a90942c8dad4b4a474a79cf0db0fa31b973d3bfb286e1c6470eb0f95b2"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.13.0/imp-linux-x64"
      sha256 "f6a554eaddfad064ce2f28a88c032db1f6d2d6a0e3ec5cd4c62f5e23fe733c8f"
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
