class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.3.1/impz-darwin-arm64"
      sha256 "f8061b2ee208e1d6ef7b6dc3ff3a33a00a9b539a2e5e92a68fff056c261b4fa4"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.3.1/impz-darwin-x64"
      sha256 "540f73e988b4f9729c32ec94a26bdc01a53b653cd64dfb239053bbfd104c55f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.3.1/impz-linux-arm64"
      sha256 "a8b958c3e6c15e78e98c69f00f819ded905310dcd02d4356db45b9d29624bc43"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.3.1/impz-linux-x64"
      sha256 "17e1c06356f0b039d85281dae0890200133528f76f9f9a58bab7e1fe6076a9a8"
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
