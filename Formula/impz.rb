class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "4.2.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v4.2.5/impz-darwin-arm64"
      sha256 "b071561e8699c57dc09afddc6b139610f47cb4afe031fa5dd715d9eb7172bc63"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v4.2.5/impz-darwin-x64"
      sha256 "9d800d1606812fd71fb7956aed6c265e5c55d2e51aa08e32b6453e13b87cbb39"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v4.2.5/impz-linux-arm64"
      sha256 "cbc4b9f00286afb9b84982fd8afe9f0146bf6b55a5b81f1be9ead8d29b94da0d"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v4.2.5/impz-linux-x64"
      sha256 "089f281b962e693143e876e28fcc04873eb06a9336d5cd6248745961b3cb46bc"
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
