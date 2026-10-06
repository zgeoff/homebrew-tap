class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.36.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.36.0/atc-darwin-arm64"
      sha256 "310884cbbeeb3093e01b9e1b23772bc47c5f8c0ca8106ac9e9d7496f3d9e3f77"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.36.0/atc-darwin-x64"
      sha256 "c32ef717c92604eb47b0117ee7b81c79431acaf357a7785c5d931b80f2960e5b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.36.0/atc-linux-arm64"
      sha256 "39b219ce50d30ff2ab9abe246c3e5ec9bdbd5807feb77693fbae9e1a83285665"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.36.0/atc-linux-x64"
      sha256 "64afb3d8a43ddf6bb8a9e2d679b932379d7e6ed395940d03604abadb5aaeb79b"
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
