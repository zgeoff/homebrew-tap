class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "4.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.15.0/atc-darwin-arm64"
      sha256 "88958d8ef6961579fcf0c185a370cf48eb84dced429cc317fcb31ce084073904"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.15.0/atc-darwin-x64"
      sha256 "fcdc23c328bbb9b0bba3154c7c41bb6cd44106528c0c147ea78fdd5b15c91be6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.15.0/atc-linux-arm64"
      sha256 "6a00126cc3ef01d1943cb322494d3a649dd0e7e746e35dec79fee876ca269544"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.15.0/atc-linux-x64"
      sha256 "37038d5590d61481dfbef928629a792cff7b079bbcb2e0f5f606ca98b5f4e7c9"
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
