class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.11.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.2/impz-darwin-arm64"
      sha256 "1da7efe01e5864743f803464d025cdb1733eca4b603f5c5ef131616ad3aa46b8"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.2/impz-darwin-x64"
      sha256 "c6246f2dac66330327ce90e786b338ca915b991c0163446a7c2a0ee80a28a407"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.2/impz-linux-arm64"
      sha256 "1a27c0d653461d0d02530ad14157a1b45fb73e2e07758912713d99e3bf5fd967"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.11.2/impz-linux-x64"
      sha256 "b11ee6cb8da21d1407a48cde6daf8e0ebef5793ad753b8ac2856a5995cc03b05"
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
