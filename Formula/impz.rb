class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.8.0/impz-darwin-arm64"
      sha256 "05f493782f924387750d7d43e7babfc75111899945f87cfff0e22b6cf2569b1c"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.8.0/impz-darwin-x64"
      sha256 "1445538c31beba6e1bf94e9824541403be1bebed3489800bd2142ec385ed4ca7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.8.0/impz-linux-arm64"
      sha256 "6b7f68fa5a0bdbc262c661bb682e07ff3d0855cdead8a0f52b1e4f2315ae6fe1"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.8.0/impz-linux-x64"
      sha256 "61b18097d6d7310a8d1eb34cb7ea575c646aebb85cd93c4401d6dbb83453d123"
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
