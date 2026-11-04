class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.4.2/impz-darwin-arm64"
      sha256 "bb3a319387ff59ddee0a1fb34adf6c13368d77f1e06b0c3c11e59bf8a2f1fea4"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.4.2/impz-darwin-x64"
      sha256 "bf78fd2d68436753b23734d55901cc51dce84ceb0d3f4325a3f45103cd688dab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.4.2/impz-linux-arm64"
      sha256 "fb1a408de60f69a4f68ffb799cb1768602298d82d11d2a459b62f381d9e68206"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.4.2/impz-linux-x64"
      sha256 "5ffceb216106d18fd87dfdc34f057e36761f7c226da7b0a70d9ffbc3dd605557"
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
