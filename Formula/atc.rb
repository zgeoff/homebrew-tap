class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "4.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.12.0/atc-darwin-arm64"
      sha256 "80746100fbdcce02c1b59398e9a21d5e63c45f5fc8c736313dd20a8a993dc0c1"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.12.0/atc-darwin-x64"
      sha256 "90c07e5c7af0e45f1f66b8ff84d6d243c7e8cfc6ff23ed883fdea844d553ac9d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.12.0/atc-linux-arm64"
      sha256 "c216f12926e50927a77595cbaedf8defe0b1bb8e280fa67290a4e5d298078976"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.12.0/atc-linux-x64"
      sha256 "7422760269d7303491acd8435930b366ed8ae7b4db43090666ccea82b6288fce"
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
