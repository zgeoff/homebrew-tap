class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.7.1/impz-darwin-arm64"
      sha256 "a922a9fc731084cfc79e629f8b9102d9ee4e27e71d5209cc7ecc4501a9b95e69"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.7.1/impz-darwin-x64"
      sha256 "4fc9c2b15214dc70aee3f502fe8a43e4458d72f435e89b9baafa288f91d3568e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.7.1/impz-linux-arm64"
      sha256 "1f78b08fc63ce465b6a4006f364b92e3a8686fe4be40bc58d6e725497f39f674"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.7.1/impz-linux-x64"
      sha256 "7a6551085199d6058f4d42ef100ee5ee9711aec4562621c0f44a2e3fbd7d40a2"
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
