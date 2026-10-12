class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.42.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.42.0/imp-darwin-arm64"
      sha256 "6dfc0c5568e4cb761997fd88b15991087730f0f3f6bacb254757dbedb0921759"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.42.0/imp-darwin-x64"
      sha256 "78c8834af93ce21ffc4f0ce01750bc99fe45b7bdcd764def4dbb8756d9a0a818"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.42.0/imp-linux-arm64"
      sha256 "f06d1b1aeb9d38d2f3c99e71cd5d32e7d8e9eb5c311f743ce99f3e5c2d27fad8"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.42.0/imp-linux-x64"
      sha256 "78c1e62003dcd60abd16ad45fe25a36a781defa00cfc5414bfc831f252340f39"
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
