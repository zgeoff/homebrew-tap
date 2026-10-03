class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.15.0/atc-darwin-arm64"
      sha256 "bbff0ad36634e6a3d3a4088ce4bc1a2bb958160f1b49a2954820347323e6b300"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.15.0/atc-darwin-x64"
      sha256 "f89d48bd305492b268f497eecf3746f8402ae6dd2be4efc0b2e496aeb77587f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.15.0/atc-linux-arm64"
      sha256 "ab51ce514d95346241ee78b17f0eb7641dd28f72c883cc893a09a073996e0c8d"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.15.0/atc-linux-x64"
      sha256 "06becc0d1cecca18f239a8ec258566d26faed2c8d96afa7ec18e6991540b33ac"
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
