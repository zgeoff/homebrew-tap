class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.7.0/atc-darwin-arm64"
      sha256 "4636cced0b91a6cc1f50719a96f12ffb536f8a8352b276c282e8aea4ace97bf0"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.7.0/atc-darwin-x64"
      sha256 "2f60c24caec70149553577f6c26f6a2517b539d98b4a67da21efc76382ca8ab9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.7.0/atc-linux-arm64"
      sha256 "5f3fce6c20dc8151dfc22c5c2ea22865ffe493ff96842100135554bc6a186158"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.7.0/atc-linux-x64"
      sha256 "f4b6106f11366b3cc08e1ade6ad7a17806e9154bbf8c65bab351ce9ee932de5d"
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
