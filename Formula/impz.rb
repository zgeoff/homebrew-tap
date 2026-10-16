class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.2.0/impz-darwin-arm64"
      sha256 "2ebee9eafe5e6a1f8c64fe113d675de9faec7eb7ed2359cfcac1147e53160145"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.2.0/impz-darwin-x64"
      sha256 "0d20a368c5c478f19f3e4f81bb0dc5ae7e506c6628c980d91af5ae51f4c4024f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.2.0/impz-linux-arm64"
      sha256 "af644afdc68511b0c2f2a9008ea846ba1167f04756b5e87a2ebe69730a834bfa"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.2.0/impz-linux-x64"
      sha256 "0282a4cf69751f1f7c0ebd1c15c0a624ce4f0066ed496b1b415b9188a428e692"
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
