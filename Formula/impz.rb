class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.11.0/impz-darwin-arm64"
      sha256 "1a5ecb6242743aa0b86f67b29e2f5098af52aacca3362a45c4456c2e44968791"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.11.0/impz-darwin-x64"
      sha256 "91ab91cc1010736eb69fd9246e7f35732d9917e34892eb00dd1063a910aae6c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.11.0/impz-linux-arm64"
      sha256 "d26779d81e643ca91a6a3d56d561890e5cce33d931b5abadaa347265ae2ba86c"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.11.0/impz-linux-x64"
      sha256 "c19ab1b6c6521841bb5b2ca47a1bc48a68f89af81b9d992c2ea7e195be09d4c2"
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
