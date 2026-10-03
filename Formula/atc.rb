class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.26.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.0/atc-darwin-arm64"
      sha256 "c45e49291c40eabea921feb5b733138f833dbd21be988f39a93c69cd42837ccd"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.0/atc-darwin-x64"
      sha256 "51af764d4535cf398ed01b2e291365d78f0856edcbb99aae04408754332bb207"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.0/atc-linux-arm64"
      sha256 "f7c516fc9c5bbc4c2ffd0a724b162dfc4dcf012e43c247a740114e2b7f385b7f"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.26.0/atc-linux-x64"
      sha256 "9eeaf21cf3d0c4df49a0b46eddf26e50f6c0b17697c99712948da855aa3fdad3"
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
