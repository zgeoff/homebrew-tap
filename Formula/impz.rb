class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.3/impz-darwin-arm64"
      sha256 "a4bb387f8bf4ad7b048284782ac242d9b4ad8eb6b4dd41712e391ed684fa2b90"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.3/impz-darwin-x64"
      sha256 "abb655aa3e282b87b0eda49e4bdfd1f074d9842d3b71bf24865dd25197302508"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.3/impz-linux-arm64"
      sha256 "fe1359fb7062852b0179c0c95768e0da02dc87ff590c0976cdc202a7680717c9"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.3/impz-linux-x64"
      sha256 "a6bdc8ff1b0ac8555a00ebad7f42cb92548d68e029bfb1d11480f5074fbceaa9"
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
