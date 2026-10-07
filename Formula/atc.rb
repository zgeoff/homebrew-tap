class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.3.1/atc-darwin-arm64"
      sha256 "fc44ae0d5e0f65d6bfcfe490074ef02716a96650ec1de4d475722a3aa56b9304"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.3.1/atc-darwin-x64"
      sha256 "19100b58cd55f67ca953679769efa7a5df9abc2c301bed799a28596e520e4125"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.3.1/atc-linux-arm64"
      sha256 "c9688a8f76a5f9cef22b31f67e631e552bb058e65159164a4ad8948e855cc7f5"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.3.1/atc-linux-x64"
      sha256 "038ea9a334ffcfe598f1ee0d05726bed77313ccf08f1eddaf8302eeec4c79056"
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
