class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.24.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.24.0/atc-darwin-arm64"
      sha256 "0e0e7e50486818ac398e980a78312867ddff91996f8839b7fb57367a465bdf41"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.24.0/atc-darwin-x64"
      sha256 "7a8303071e8ca04b08d3a93c39ab3984912c1f23146fe36013c127a8095f6b7f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.24.0/atc-linux-arm64"
      sha256 "6a5ce3ffddfdb77c91c4280d137b70ddbdb625958954adab94fe750b4cd41759"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.24.0/atc-linux-x64"
      sha256 "f3c9edcddd22ee7f21650ceb0d0543cc36690c1af2ba234f78c936df839cfdb7"
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
