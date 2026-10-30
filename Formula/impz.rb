class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "6.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.2.1/impz-darwin-arm64"
      sha256 "be2cc122f302bb172a17d9deb6a0b44ea54ff5611fcf7adae35e9f0e6b995a88"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.2.1/impz-darwin-x64"
      sha256 "a0819e66bbcc8797f875c46274c6f55de55d40bcb4b18cc499589da9a3cb3ede"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v6.2.1/impz-linux-arm64"
      sha256 "a47526575a7ae23e7c21b1f2a19d58b634e142a62288fbdd79f1c14f2181aadb"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v6.2.1/impz-linux-x64"
      sha256 "bcd3ab716beba743068aa1373fb8107f66fc5837b401e896aefbdf9357e0188c"
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
