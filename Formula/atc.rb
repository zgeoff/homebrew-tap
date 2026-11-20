class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.21.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.21.0/atc-darwin-arm64"
      sha256 "de799046385bc4eda443121944d52c42ef530ce27c9e3656f3f9d32142d858d9"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.21.0/atc-darwin-x64"
      sha256 "e323063837c243534908f649693a0f74123bd04ed899f971eed8fd1a8a888951"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.21.0/atc-linux-arm64"
      sha256 "43480ed097bac94cc9428b5bc6777f6a6098ae82d1d6461a0949a30eacb07704"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.21.0/atc-linux-x64"
      sha256 "9e5e7f24472ba446c935eed183f3eeac01c366f1f6a6aa952717c55cae1c8e3b"
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
