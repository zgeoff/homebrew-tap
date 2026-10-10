class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "4.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.0.0/atc-darwin-arm64"
      sha256 "c24804bebfc151ff028d96d0c096a55321cdc520f869f173b3e9e896348562a2"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.0.0/atc-darwin-x64"
      sha256 "1f4cf24837b97be0181b94d54b4aa837e6581d3d3adc708512fc7afb275ebd1d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.0.0/atc-linux-arm64"
      sha256 "259309837c72ef40eb8c36c427aa607d1ded611bcf5bbc691b870c7f5ae89da3"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.0.0/atc-linux-x64"
      sha256 "f988a2a1ea3aa0db6cd2b11ca5fc8b7edd1da5d185b838449c055e7fdb66792b"
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
