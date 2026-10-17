class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.4.0/impz-darwin-arm64"
      sha256 "8d26cb9620e50aa53266618ed30a2f513e24f85bad261b32be5e91f08b67cc04"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.4.0/impz-darwin-x64"
      sha256 "8b0bf036ded09b7b9764d63d39edbe1aa6c05cc43ce71443786a5688e0dd7eed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.4.0/impz-linux-arm64"
      sha256 "d6b63da086c7b5b145885c29a79898d2591c4fbe6b603a520f7478ea48aabb8f"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.4.0/impz-linux-x64"
      sha256 "40e04761f05055919bf7f4ac61cfd02dfd30ffa723e9fbdac5c193f9454184b2"
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
