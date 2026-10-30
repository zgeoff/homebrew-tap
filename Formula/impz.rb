class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.3.0/impz-darwin-arm64"
      sha256 "8313772c063ab2745a5faf167a7e71720d5e463dee49c51cdb6e72678a30e6f3"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.3.0/impz-darwin-x64"
      sha256 "767125b00374c0674cd750d8c54ab4ee46af5f32814ab9613983c2f51f97dae0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.3.0/impz-linux-arm64"
      sha256 "ccab65e163792d45a9853dd919179af681942109c13bc287928de26356ebdd65"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.3.0/impz-linux-x64"
      sha256 "25e608d8f076d66d9b2f5c7b0725376999b174b19561cb24929be55944d514ed"
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
