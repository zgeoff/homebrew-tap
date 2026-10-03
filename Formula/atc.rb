class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.10.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.10.3/atc-darwin-arm64"
      sha256 "c78c9a0e7e86dff385e84153cdba850ab7b75dbae5de0521621a55d03fc33738"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.10.3/atc-darwin-x64"
      sha256 "1843242579931cb7b38e3a36d5e12658657dd9d492f6c3f3da542266cdcf4fb2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.10.3/atc-linux-arm64"
      sha256 "983d73b31218f8b3d7a6f687a10509fe4d632a07b4c7d272e216d8ff28c67bba"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.10.3/atc-linux-x64"
      sha256 "66b19b4e3eff976d0cb13e08b0d6b4165d6100b8c2eb43e8aa06b19d96f01544"
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
