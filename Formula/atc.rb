class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.24.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.24.0/atc-darwin-arm64"
      sha256 "7a8fb31c09e8bc39dae558514be909fccee1d2dc57cd996d9f77f1e64e80ce41"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.24.0/atc-darwin-x64"
      sha256 "a250ab511dc17462afd554c452c0dcf5aee378946eeea8260e2fbed0cbf008d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.24.0/atc-linux-arm64"
      sha256 "3ea1cbd87baca1414e477368e4851ee350126184535048dc98c135d52b391ff2"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.24.0/atc-linux-x64"
      sha256 "7ad985d1deb0edc614b1ed1466db885e5f5a36af32750633e853b1490319787b"
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
