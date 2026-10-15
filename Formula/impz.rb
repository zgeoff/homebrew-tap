class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.1/impz-darwin-arm64"
      sha256 "058d70b99b2f85fdc192adebe2fba8d310fe711fd1507f98c924d8e72a8cb052"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.1/impz-darwin-x64"
      sha256 "bfcc63541b036a4489a4342d1532fabe7a21e0a2a52e46806fc6132f814ed6a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.1/impz-linux-arm64"
      sha256 "1ca2948d44d9f2dda1c1e24a58781754d9d6ed80d6fa50a0c6bcc022bb5a7ccd"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.1/impz-linux-x64"
      sha256 "59393f12d9a1a70e43f21002e653a1362d02f9067c2cfe6d1e962e65a052edfc"
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
