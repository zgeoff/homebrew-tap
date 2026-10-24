class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "4.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v4.0.0/impz-darwin-arm64"
      sha256 "0719ea4d3819658bdbec6e3e9a70b43a4d47bf3c6f7c0b52fd2cd8075f7401aa"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v4.0.0/impz-darwin-x64"
      sha256 "0268348f836debf2af29fabbfb5560fda8bd77d352873d997fb2e37d3a7ef7fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v4.0.0/impz-linux-arm64"
      sha256 "6db6ec20bc6c1824ed18462ce6beb61bec3f06d2d83be1d695af5297bc04e111"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v4.0.0/impz-linux-x64"
      sha256 "8bbe06c92af6c3dfc2fa89bacf9a34d4f3dd18055d3690fe3d5190c79386db0d"
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
