class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.8.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.8.2/impz-darwin-arm64"
      sha256 "1c8d2325c75a208c877842ca1eaccc8a26f788bf5d91b73b91f91f238a57c921"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.8.2/impz-darwin-x64"
      sha256 "292ad9f876c98eec953549ea398457d583eba78923fb1e690e7bee91bf5876ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.8.2/impz-linux-arm64"
      sha256 "7128f6bd70adde3d0a1e5d8135b2a1a5c64754403ceeb848482f95926f2367d6"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.8.2/impz-linux-x64"
      sha256 "f3e057bb47b0581b810a3497d903c0e5add16955d6e3e6ce56cd75dd42c4cc1d"
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
