class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.30.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.30.1/atc-darwin-arm64"
      sha256 "046a9672f9ceecb6f6e420ef1e932862cd63a4cd545eba8f0a18a85fe12d7043"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.30.1/atc-darwin-x64"
      sha256 "ee2abb8b068d86911ce54bcdc393e520f84e20abae7de383f2dbfae0f06edabd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.30.1/atc-linux-arm64"
      sha256 "8626c5664130e6d985e95589139435d95fad68afa660bc66b3eb43330275ec7e"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.30.1/atc-linux-x64"
      sha256 "909a2d6a03339ca1ade2bb734b8919a114795a792c3c2b740da383af46b10fb3"
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
