class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.9.1/atc-darwin-arm64"
      sha256 "5005debf90aff845b1a61374afa0dd3a9e7f258152a19c34710c0aef6a3c9abb"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.9.1/atc-darwin-x64"
      sha256 "3594b49c1d128e194c6ada392b97e0ecd6136ee6367957ba83be568925ca65de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.9.1/atc-linux-arm64"
      sha256 "97acf018397e1807b5e394c6ced1d3e1f245c8bccf78e80e9abd61242179415a"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.9.1/atc-linux-x64"
      sha256 "4b1c5e26f62e64ab3eb3ace77cf777167d2c990873f8548f76cc6c6bf49bf102"
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
