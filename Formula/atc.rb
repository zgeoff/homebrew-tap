class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.7.1/atc-darwin-arm64"
      sha256 "1b3367d77af88b5a6f79eacd8c5fffbe70d7738de2884d0396b1505948c2ad0b"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.7.1/atc-darwin-x64"
      sha256 "f0214a78e957620ea3526c88e48aa232d14b6a2ee5822f27ddc2d5023a68d312"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.7.1/atc-linux-arm64"
      sha256 "a1baebd35a40cabcc4499f3a7b83e98f46cea197a4a53b99700b6028e969fde9"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.7.1/atc-linux-x64"
      sha256 "b9546ec5e1a4af4f3bcd0c9051817dbf76d5e6a72176a0daec38af46547890b1"
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
