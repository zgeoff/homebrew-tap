class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.18.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.18.1/atc-darwin-arm64"
      sha256 "87e90263ca73a09525a16420c28b6555497c48d01687ef63f4d26ebecfc5dd96"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.18.1/atc-darwin-x64"
      sha256 "bb045a712d708b5c29d0467398a7f01a7141b00918f76a02f8c3fca6b2848f38"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.18.1/atc-linux-arm64"
      sha256 "6d6cd3878fa6784c2b76946a9fbfb87852c870460c016b65533f17f9958110e5"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.18.1/atc-linux-x64"
      sha256 "4e56b45d488e4a8ffa59aaa9880c56988fffc73ed8b3e88dbe0c28c5917fd31d"
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
