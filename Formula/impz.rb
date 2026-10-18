class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.5.2/impz-darwin-arm64"
      sha256 "d0aeb2f3787efd921f78ef6ec807969333d6363ab5d6def4ca2ffa805814703f"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.5.2/impz-darwin-x64"
      sha256 "e3cda57694b155ad86d24aa852e61cbb41db97b0465765eebcec85d85c9268bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.5.2/impz-linux-arm64"
      sha256 "6e808fc88d710cbb05dc696e67c6e36892ef0214c33fb27daed4b743c9d2ef41"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.5.2/impz-linux-x64"
      sha256 "da01f56146a2d15ed293e6ddd8ce588e23a753058650ac98c4143fe794336080"
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
