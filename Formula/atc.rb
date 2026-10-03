class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.11.0/atc-darwin-arm64"
      sha256 "7519734703004c397f0a9b5aa7ee054a3e47d3a274484fcee5c9a5ca59219c12"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.11.0/atc-darwin-x64"
      sha256 "68fab20d20ca9c751ff75f871438e4d80c45be697f8848e38fd5a99c033b18b4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.11.0/atc-linux-arm64"
      sha256 "20123861d46e396496e602372e7d95fba1a0eaceb8e8641c9a15d52448ab09ec"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.11.0/atc-linux-x64"
      sha256 "ad37fe00fd15cac57f145e8fae860d3227cecc98bbce1b9e8f20d33696d92e50"
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
