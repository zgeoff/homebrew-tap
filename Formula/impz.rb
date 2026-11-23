class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "7.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v7.8.0/impz-darwin-arm64"
      sha256 "ed479a2b7478fa259406c77e61dfa6aee5ed36d4d7250d1201c1f02c7a9f24e6"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v7.8.0/impz-darwin-x64"
      sha256 "9bec96ed517cca6dc1bd28750dc7bf05865d1205131df9c198b6bfecb26e82e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v7.8.0/impz-linux-arm64"
      sha256 "9920b0c55e83755c8c61da950648427d5679636fd2d31838bafd6a435f55fd4c"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v7.8.0/impz-linux-x64"
      sha256 "8c2887577817bb3ad07413ce91b1c19c68c3c68bf62be7eede49248a3f480a44"
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
