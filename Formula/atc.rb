class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.13.0/atc-darwin-arm64"
      sha256 "cac00380a4b3d02101782533f8f6b5c5eb3b47d3b80f844da16bc7606a5cb860"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.13.0/atc-darwin-x64"
      sha256 "523dd33469519174544bde5c1aaa6d51aa11b6cef65c43df7d48f568c049446f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.13.0/atc-linux-arm64"
      sha256 "2d8ff6bf571d7a2e9c96eb3b4f4f65605c200d59f1814d185516d7e13fcbff67"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.13.0/atc-linux-x64"
      sha256 "df4706a3af3161fa66413879684da85b9d723fa3e661a5983e1980d0e0e90a08"
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
