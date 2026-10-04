class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.26.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.4/atc-darwin-arm64"
      sha256 "b2d85d1f08cb1bfaf21b15ffc91e5bef7d1b6368116251f52db22d1e4be5b94d"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.4/atc-darwin-x64"
      sha256 "83899ba0f5d8ab89b892a453b8eb8b181c326722512ffb72164f683b037f9364"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.4/atc-linux-arm64"
      sha256 "31a6fdf7dd5e1bfabf84b845c165fc2b15723f05f3bad77fa99bd40a6ac4a708"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.4/atc-linux-x64"
      sha256 "8a87e20841f0050fc83422b747f2e09d95f58ec61ec6b11b54e119284a961edf"
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
