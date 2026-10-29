class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.1.0/impz-darwin-arm64"
      sha256 "fc75873f7f7a38c1207ed1732c749ae23d354de0c050fad72adbc6012e06852f"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.1.0/impz-darwin-x64"
      sha256 "ef6fce96d9b074247f0921d7103c4950174a76f00f35ad3a24de0e3d185393a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.1.0/impz-linux-arm64"
      sha256 "7c34eda0496c7245c66cb0eb6bc8839134b8beeaaf34656f3ed1cc79b3eac1db"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.1.0/impz-linux-x64"
      sha256 "45617b7d6bcd45b2a043cffcb37499d3f69a4b8ca3a0d0d9b2a66473eee90f76"
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
