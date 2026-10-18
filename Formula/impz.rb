class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.5.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.5.4/impz-darwin-arm64"
      sha256 "0413854f0d80a327cd188c513cf1cd880e5bf0783f98e838ba3986254af46732"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.5.4/impz-darwin-x64"
      sha256 "20a8c153fe62ae090193216faf5bfe8510e9a16a0de122d329790ccbd504571f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.5.4/impz-linux-arm64"
      sha256 "b8643235641b4e1ed5e93278b56fa8755f6eb9e6c09f6ef7d068eae826c9349b"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.5.4/impz-linux-x64"
      sha256 "4c300620bab67d4f9ee03c14f8ba9c801e6ece8c2e8184b7cb9e8598da6730b5"
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
