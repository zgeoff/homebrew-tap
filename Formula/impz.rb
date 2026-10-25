class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "4.2.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v4.2.4/impz-darwin-arm64"
      sha256 "ee5e98b0a859a729e91e88313511fdecd64210640ad00c41585e874de3c32c9b"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v4.2.4/impz-darwin-x64"
      sha256 "1bd61425f583520a3e451f77f9d00867c1998c8bf0137e29ad81b702e7511346"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v4.2.4/impz-linux-arm64"
      sha256 "beb3ac3b4268beee35392175abcda9191aace15474db8058165bb85093490da8"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v4.2.4/impz-linux-x64"
      sha256 "e8cdcefdd76d1316cb5c2cffc6f35866c7731e69d8cb45fe7209b4d22659b73e"
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
