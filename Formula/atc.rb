class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.10.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.10.1/atc-darwin-arm64"
      sha256 "b621340756805a09d58f9e958407b8c433a13b019a7162b450adb76273f69246"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.10.1/atc-darwin-x64"
      sha256 "d4514d61be6e3e27245b61004f9f2b8f3f48fa46fb9688f1b17d86d87295c65e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.10.1/atc-linux-arm64"
      sha256 "68076959468297413bc33db11d0e1ae064a22f25717c2205c9a6624e35035f0d"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.10.1/atc-linux-x64"
      sha256 "14ffa8ca509714e34624eff7bc99a7b25da725e316b4e74bf3d91d681929528e"
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
