class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.6.2/atc-darwin-arm64"
      sha256 "6a57f3b2524eb62c8210f26f9a2b8e5f728eac067f9f33b2211ab61b36abba06"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.6.2/atc-darwin-x64"
      sha256 "288f9117f3850a0cf78f6ef046aae3edb7485cbd92b8c02479100417c4b33633"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.6.2/atc-linux-arm64"
      sha256 "da09f02c6a8d8d57f34c19f4afdfce6b6f2a8c045820b35e157747aa1174e538"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.6.2/atc-linux-x64"
      sha256 "8a58a970cf80bf2ab30cc06d9bac4f7053f3dff4ae52f2efc439d10b9a9b4cdb"
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
