class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.41.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.41.0/atc-darwin-arm64"
      sha256 "2b9a51c1d6a29ac5a0ddb76d9afb21d4ce859f0d4c2c00e9b80b277cc46dd6b4"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.41.0/atc-darwin-x64"
      sha256 "22cea157878690ce6ca61b64e11fccca069d1ea7661312f7484314757d775e3b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.41.0/atc-linux-arm64"
      sha256 "d988c50a831d0bde37a06d886ed172b3b62bd79c3763b69c409182191bb0f854"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.41.0/atc-linux-x64"
      sha256 "c5d7abe0fead99d2d3a7dec1d13fcf28b04829c3539b46f320ed3f657c839e89"
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
