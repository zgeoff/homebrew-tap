class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.15.0/atc-darwin-arm64"
      sha256 "c8404ed028d8df52c9b7f4a19e430d7a5793ae80e427f6fcdf800f32f920f20a"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.15.0/atc-darwin-x64"
      sha256 "f9dc1b4a2bfa3b1a53998ed2d91368afe7df7eaf0ce0ab4179f8754b2e8ed0bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.15.0/atc-linux-arm64"
      sha256 "a63d17ac00903ee5910fcc97b71bc26439abfb22934401a824e12721617095ed"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.15.0/atc-linux-x64"
      sha256 "cd69f74a0d3e253aa6ad658d71967199e6470cf8254fc2b004f79f672003fe43"
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
