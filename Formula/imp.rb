class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.41.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.41.0/imp-darwin-arm64"
      sha256 "254d104d370bcca28b92e4b3a8ecb1f06b70909922d23311d00bd7bee48ce84c"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.41.0/imp-darwin-x64"
      sha256 "b36bb6e4cf8de8011345088cd1f8e9012987d9d7a134183ded7e997eae94a7db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.41.0/imp-linux-arm64"
      sha256 "547e0b279f05d4ed3969b7c7c7f030716146bab78ab7978f9a3fcba7ea119f98"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.41.0/imp-linux-x64"
      sha256 "81ce7363ef1828e5e136e1c978932bc5d4e1bd44a625e470ac5b4a56fb95a6e7"
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
