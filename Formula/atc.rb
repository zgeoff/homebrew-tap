class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.9.0/atc-darwin-arm64"
      sha256 "b7925a6bc99088a36f1854316c7c211cf4d43f860016184c7446d28cc4b46f3c"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.9.0/atc-darwin-x64"
      sha256 "17e247048b2c696ad42275e6e6160fdf0b8eb4cf58bc46367c8f567c451414d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.9.0/atc-linux-arm64"
      sha256 "137fb334d19cb69985edc84e3ec5983a855e4d50b70df335faf046172daa8143"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.9.0/atc-linux-x64"
      sha256 "c8bdee4de5404e4d382daa00f5b0149ed0018fc706fe82460ac2dea4203f7281"
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
