class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.10.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.1/impz-darwin-arm64"
      sha256 "d520293d1d36e1c83ca4b9a35a4d9c3eefaf1d1b8c2cf4ffd1a3e753d29c498a"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.1/impz-darwin-x64"
      sha256 "8effd9bd93b95bec4ef9f226276324dcd5c64c796dfc74fd1709053daa29f4d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.1/impz-linux-arm64"
      sha256 "64099f05475f8e164f04bed5d4ceb4213fedf9bba333ab71c32eb1514d4d5ecb"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.1/impz-linux-x64"
      sha256 "365c39c328feb9e889d73c30635246e05602585e5ae37bc6e7c92898e7f49465"
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
