class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.10.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.10.3/atc-darwin-arm64"
      sha256 "aa1051b034b8b70f7831baa84c60b050ec400ce7d3f6a3a0081bf13d168112fa"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.10.3/atc-darwin-x64"
      sha256 "711bd286dc5d5969c9600ad6e5440b19adddc46c019f0987c4eb4986a955c149"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.10.3/atc-linux-arm64"
      sha256 "17eb0d12ac32394680fb7e407b64212addc9b1db22dbd246229053c31895ea20"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.10.3/atc-linux-x64"
      sha256 "3f396e94fd9750ea8b3786ab6ed60887080c5ec1f9d29dd2b54b29651cd94faf"
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
