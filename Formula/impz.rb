class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.4.1/impz-darwin-arm64"
      sha256 "a7e90dd8d6f1976bb9d87f49d97dfb3f7c7428f413e86bf4f69c4826dd7a51ed"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.4.1/impz-darwin-x64"
      sha256 "dff8a9f917b7d6ec626892ffa62ad6ec9dbdc1ecf34b16b50f85b046045e9a7c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.4.1/impz-linux-arm64"
      sha256 "489e2349673f30d434b28374ed36c4eb951df7856d92b4b8112eb9c8b0729986"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.4.1/impz-linux-x64"
      sha256 "73fc660da024d5484580b208c4d2317c3cb232757c85025dc7711da02547c693"
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
