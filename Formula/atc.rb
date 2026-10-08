class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.6.1/atc-darwin-arm64"
      sha256 "0f9970da3f9d5b67b81a0dd83f59cb2335e85661ad2b98a0cc0ae3f896042fad"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.6.1/atc-darwin-x64"
      sha256 "08a27854eacb7ad17d7d52f078ac72f2ffe9ffd714428b13769bb9cbd9ec17c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.6.1/atc-linux-arm64"
      sha256 "e6b373758476802c0544de5836071c7573cd09d900a4f5bbf43fe6b0ff977b11"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.6.1/atc-linux-x64"
      sha256 "c6325ee0da886ec738521cc94f8a65c5ce6eb8a584ef27dc9d44a4d529d70f65"
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
