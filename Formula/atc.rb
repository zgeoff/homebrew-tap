class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.8.1/atc-darwin-arm64"
      sha256 "d9c4afd6cf0ab55e85c0dd97a32c3da884a51386da74d3fd5cb4addb0120ca58"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.8.1/atc-darwin-x64"
      sha256 "29072df3f5383f00ca38529e4e064541d4054896b17fca3a2ea0272e22d9cb28"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.8.1/atc-linux-arm64"
      sha256 "ccaf60ed8cecaab39aa04a6118c9187d1c3716975ce4eeeea4e54ce790c8cc67"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.8.1/atc-linux-x64"
      sha256 "a3f2e68735563c6ab842f82a4eef69dcf5ab30de24369cf59262fe88959dfa7c"
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
