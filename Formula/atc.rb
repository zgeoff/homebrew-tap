class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.8.0/atc-darwin-arm64"
      sha256 "9d8451b06106e097489600200a8798f302b485878aaf610c4a00b5f8799372a2"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.8.0/atc-darwin-x64"
      sha256 "7bb7b98632a6bdc7c85203ca7c1412dd5f84714214217ab928398c21b331928c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.8.0/atc-linux-arm64"
      sha256 "e3d66a5cffd4eb978cec780105a9d230e64ecf92ac4fdf0b09803c0b6f455d21"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.8.0/atc-linux-x64"
      sha256 "c586420f18e5bf8c84c1f261ab8536f06ab6aebf0a4546214ee138c23ff0a438"
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
