class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "4.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.8.0/atc-darwin-arm64"
      sha256 "f20d969b917c094dd41b22dfdfdda888d716cf3594ae5df58997945207771d38"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.8.0/atc-darwin-x64"
      sha256 "dcfc6973525a4527dcc7b5f4dd95404eb782f677afbf1e50811940a784a1e800"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.8.0/atc-linux-arm64"
      sha256 "bd10b770debc7e51868c5e3dde4b5ef574a902f0b89224db9bf5b26d4d5f2575"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.8.0/atc-linux-x64"
      sha256 "1492d57f98a85227bd9d4735137283bcf73daa8433292be532a1b5268beca123"
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
