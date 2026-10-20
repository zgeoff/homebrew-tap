class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.8.1/impz-darwin-arm64"
      sha256 "c3a23869fc6b7340381d67763e8977a48caf7405cb1e1e142a2e184b7d33d13a"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.8.1/impz-darwin-x64"
      sha256 "31001e22d72089d3af2028d5a832e11384c8191269218dc2320ed9cdde17b6ab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.8.1/impz-linux-arm64"
      sha256 "6dd09a1a3f2801c7642f95967e569b758d0e313ead7bae2ae6b8b2649a6423c8"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.8.1/impz-linux-x64"
      sha256 "941f3e2f920c32fb9790774c67070b5812306b22635b734946dd14245d7717c3"
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
