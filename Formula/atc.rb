class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.9.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.9.3/atc-darwin-arm64"
      sha256 "19e3401518e7550b4d05e1b87a743da359ab6d2a4fe2909cfe39e3aae493a8bd"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.9.3/atc-darwin-x64"
      sha256 "7eb7717db4a59618befbbe700718cf4d671ac037de6cee05557abc1b735feb0b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.9.3/atc-linux-arm64"
      sha256 "2723bcd7f4b782902c13adfbb6063960f2a3ddfda759d8dd9fc4ef37ef9cd82c"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.9.3/atc-linux-x64"
      sha256 "7f26a5a4c8cb449ddfa7ce8555193611b567bd3d1d8aad4e8e37a9c1127ba854"
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
