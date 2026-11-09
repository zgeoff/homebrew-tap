class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.11.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.5/impz-darwin-arm64"
      sha256 "56d9e89acfbf779f161e3791b6cef6cdbc01856227c559569bda31707cc2a7d0"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.5/impz-darwin-x64"
      sha256 "26ae1dc3a1308078596fbdd5b93c655b9800eaff1cf2e41d5e1d16e9f73f95b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.5/impz-linux-arm64"
      sha256 "3cf683b56c9bf8ccd24e65ed353f96dd1bd1863ff7e040ac3f9d856576f4147b"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.5/impz-linux-x64"
      sha256 "5caec1c6fdbb0778f6a527b5c15a75ef20d2051f3ea466f2e03268e7c03d87a4"
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
