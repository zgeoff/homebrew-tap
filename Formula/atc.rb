class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.21.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.21.1/atc-darwin-arm64"
      sha256 "238fde9c542ed4cbcfbef417dbcdf3369062384e7a86b4371c159d342297728c"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.21.1/atc-darwin-x64"
      sha256 "95030840a5e6192432472399915ee9ab419aa8cc7ef64c57c46ecab76e3b1577"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.21.1/atc-linux-arm64"
      sha256 "b6c4278c3fb8e108bf35c8f9a4f2094441cd67b7f881fe9dbf9222acaef9c839"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.21.1/atc-linux-x64"
      sha256 "8fe53b575d33ae0c129eeabe42604b34d97002dd92193621ae06d9ad252c9656"
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
