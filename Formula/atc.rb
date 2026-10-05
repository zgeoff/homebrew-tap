class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.27.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.27.0/atc-darwin-arm64"
      sha256 "75f3c519dcfefc5d7d458db850616f9bcaf9d5346d47030d4a2c92c0995a4a42"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.27.0/atc-darwin-x64"
      sha256 "0138add000e8c2c7d6f128111c86ee0c6decc90650f6270df2d9a5798101443c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.27.0/atc-linux-arm64"
      sha256 "67f5e7276e7c0edbe9de06607b4135b2688ad01c28838cafe5da900d151e648e"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.27.0/atc-linux-x64"
      sha256 "f131edabf080ef44b01993d42168cf944ce667032f8edf297490d481f0e5e667"
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
