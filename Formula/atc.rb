class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.14.0/atc-darwin-arm64"
      sha256 "7d80b960e12f5541d17286942c8a5131bf94430edab4656268e959960661871f"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.14.0/atc-darwin-x64"
      sha256 "522fe9268b4e4b18f2436382ea25f04c800ccf42007abdadaeef1fa1be6fe0c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.14.0/atc-linux-arm64"
      sha256 "c8ef21c6eafadc9e86f7b9e051223bd58af0ec217ca6007fb7d732b6a803724a"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.14.0/atc-linux-x64"
      sha256 "dfae106019090570031d4861f79d4a3252419a289b4313c83593fcc138a92bd9"
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
