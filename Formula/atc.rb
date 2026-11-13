class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.15.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.15.1/atc-darwin-arm64"
      sha256 "8657e9d0106f60aa20ced46bc94548821e828bd56bfdccf0da76fa5ce5501b11"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.15.1/atc-darwin-x64"
      sha256 "f3857bd43f45538b47cbb9f8727f0941bb68beb72c133aad9cf2ac2d7e7a2499"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.15.1/atc-linux-arm64"
      sha256 "d87846974a3eff46ded2fec4c830f3d7490847d57bc27f5e1266f4235471df37"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.15.1/atc-linux-x64"
      sha256 "562ed0834ab6c04e7c3db28f4f817aaef8ba5ddc7523c5e1c690615bea3c1802"
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
