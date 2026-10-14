class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "4.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.7.0/atc-darwin-arm64"
      sha256 "10cdd0d9b928488463424b8a516ddf34238ac1eff254eb76ca25333d9b48ef2b"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.7.0/atc-darwin-x64"
      sha256 "de2f3c933fbae927580dbbb97f6601e177b4ae335b97d22a4479e786a62b6ea7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.7.0/atc-linux-arm64"
      sha256 "622a2a19374d360194e1f94331bfb1cb776477437343919252e75a837d4596c9"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.7.0/atc-linux-x64"
      sha256 "8c116389d39cdce27855431f2cdb1cff86d8ab5fdde5c500e45c606a2e986846"
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
