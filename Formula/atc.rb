class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.7.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.7.2/atc-darwin-arm64"
      sha256 "ff38614d3a4e41e51399042380d9cf045ad388b72e936d6d4f7b2616dd19a577"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.7.2/atc-darwin-x64"
      sha256 "15355af62a6c55598cf0e629531546e040eb220bba4653056cdc7de5e6049df7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.7.2/atc-linux-arm64"
      sha256 "42ee22261b2ffaf4f32ed8ad831c7d546acd3ed1858775748c97d58d0bd96ff8"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.7.2/atc-linux-x64"
      sha256 "b001f15b65a094fee457704b04e7a5b475f30a9f0b2fe81eb8b0e5d51d3a6585"
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
