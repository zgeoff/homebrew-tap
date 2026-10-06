class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.36.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.36.1/atc-darwin-arm64"
      sha256 "36a9e6cfd41aa29d2d46690c8eeb26e629bcf85e19a49e257db5e09032fb523f"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.36.1/atc-darwin-x64"
      sha256 "eef11a1f9bb25e9036dcc56339503207f46b9dc1049d350b76bf6355ea7e22a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.36.1/atc-linux-arm64"
      sha256 "535bb0b7896ad83fbc94edc28c0a78bf06f1ae5dd40bccd85dd182f843f78a71"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.36.1/atc-linux-x64"
      sha256 "c9a0d1efe4c03218424271b330dfd119137e7b87faf39d0ed4d356eece00c828"
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
