class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.0.0/atc-darwin-arm64"
      sha256 "bc323da453de4aef94d738e83c07dfacbfd27f64af99f3e7ae3a87f1cb158a27"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.0.0/atc-darwin-x64"
      sha256 "6d136668816b5aa644e224a68eab369030d42aa3445bd304bafedc4669561b78"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.0.0/atc-linux-arm64"
      sha256 "a96635d54e2a4bed5c62a17c4c01f4441f257bc68ad3a92d62fde00462c43bc0"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.0.0/atc-linux-x64"
      sha256 "c82c1ea283d03605d26b8dfcc134052765bb84818aaef2d79aa0d6bd9a9c80d6"
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
