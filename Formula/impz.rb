class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.1.1/impz-darwin-arm64"
      sha256 "780963fd346babee1421f6448bfc63494da85ada26a385ea668db346cb3618ed"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.1.1/impz-darwin-x64"
      sha256 "28ba1b3e2e27f91eab262add16d01e8adadd0570da88b83cc3a9797d082d870f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.1.1/impz-linux-arm64"
      sha256 "423b2134b4efe8b2f041e99f5246453745e71e0d92837543b5a31f481527da35"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.1.1/impz-linux-x64"
      sha256 "59cc519c1545b02c7239bbfb05a134891fdcb1c47d3bd71591a30a521b6a24c9"
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
