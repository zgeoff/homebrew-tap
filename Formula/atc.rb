class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.1.1/atc-darwin-arm64"
      sha256 "fd7ef581ba01bfd7ccec88a9a30a12548d38d8cdebc207850a2712f471ee1097"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.1.1/atc-darwin-x64"
      sha256 "7dd41cc089e08b07038d3ac0b8a19f41e0f92e55c864aa4ef4de35632455c8a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.1.1/atc-linux-arm64"
      sha256 "134e26ad47826a4ac97d1e5edb73ae4760d40de7c3bd21b9d9239d44ec0e02a2"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.1.1/atc-linux-x64"
      sha256 "0ac910846bb933581b0519c13091d05a1a174f4ecb6a85ff7723211bc359e445"
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
