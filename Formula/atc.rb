class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.27.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.27.0/atc-darwin-arm64"
      sha256 "2b8afeb91d092056ad6a9c41ba2a4a822b501531a997685b24732cf98830db04"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.27.0/atc-darwin-x64"
      sha256 "b569abcb6ac054f126eff026a262b0b63276c866dd3025a0090571f344ed07a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.27.0/atc-linux-arm64"
      sha256 "9147518846b1cf8ee0abb29f18ab2c224028b663e86bd22b08c9768be852239b"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.27.0/atc-linux-x64"
      sha256 "56cf169f3abc71061e74e3b086848790a91a6fcee1a0a057bc24a500d15e6357"
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
