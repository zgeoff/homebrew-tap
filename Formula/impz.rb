class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.0.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.7/impz-darwin-arm64"
      sha256 "90d5ae061dcb365c734dfe3568c6771f0d075bba66db0097f36dc2b1e25d7cba"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.7/impz-darwin-x64"
      sha256 "33e9666252192176f6c0c4d26a614f5461b07cba908686c0d3ec506f763cbc6d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.7/impz-linux-arm64"
      sha256 "4b31e47d2f18e2e8e67ecb4d423697e3ed5aa730f552e93332af45dd4ea95e68"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.7/impz-linux-x64"
      sha256 "cee7d2289c574f93425ce35f76e0ae84cd0d7aa37a9185c286da1950185e3a81"
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
