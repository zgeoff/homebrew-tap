class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "4.13.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.13.2/atc-darwin-arm64"
      sha256 "00d37925534750a9813a473776453d5037163c756f06fe1cc2ec57d2c27507ad"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.13.2/atc-darwin-x64"
      sha256 "623e43086cf2722072ba778c8ece7c4655191bb8adc7aa24c89957b9476b74ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.13.2/atc-linux-arm64"
      sha256 "ac7dfb032ca8bfcc58731d587a29729969e931d13a302b87e05e787da893db89"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.13.2/atc-linux-x64"
      sha256 "d45d4aa0d4de210012b26aa8956bb390297ab095b5a758a04e0d8aa46576b90c"
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
