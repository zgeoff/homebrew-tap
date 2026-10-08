class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.9.0/atc-darwin-arm64"
      sha256 "19b79f56814a38d53b11264cf41b90367fbf63691f9a6c821a0288399e7f905e"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.9.0/atc-darwin-x64"
      sha256 "f2da4228833e453a8ceb6ba2372118c501545c3afc944a89911dd63a3ced67ad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.9.0/atc-linux-arm64"
      sha256 "bad5395327998a0cc8d329482e9da8a1dd4c5013ef4c4dfe131426e8224e91a7"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.9.0/atc-linux-x64"
      sha256 "75b5d480b56536a17d4c8965a4d597fdc1b4c80c64611361ea474455f81a61d1"
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
