class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.12.0/atc-darwin-arm64"
      sha256 "35e2c6d7290077e910feff99ee033de402b7d6fb2c0d6de7a7726d5b2e11cba8"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.12.0/atc-darwin-x64"
      sha256 "a05df4def1b63f59c536eeb80fedf5a14b4f2217145ae647b148428d3756e318"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.12.0/atc-linux-arm64"
      sha256 "20ec37da5a6b6fa71be2785083b2ffe7b3b9f419efb5dfceb8fc3facb00eaf1f"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.12.0/atc-linux-x64"
      sha256 "236fa6595604f3d760ffe96235997ba5aa66bf05002bc86b50d877d23e52a780"
    end
  end

  def install
    binary = Dir["atc-*"].first
    bin.install binary => "atc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/atc --version")
  end
end
