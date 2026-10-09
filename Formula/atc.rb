class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.10.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.10.2/atc-darwin-arm64"
      sha256 "98c36645d05235a80232b661ae39cd8d8cad1f26543d6b2ee4179b8199ec1a78"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.10.2/atc-darwin-x64"
      sha256 "8876cd2bea77d98553a4c0bcb1ec4260c7381dc6664b8de104e49bf12bc304f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.10.2/atc-linux-arm64"
      sha256 "6078e3d2f2d2444980847df8badff5c7c696abf3ad83e06bfbc24de3f3052983"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.10.2/atc-linux-x64"
      sha256 "8f47233eab37dbfc0b700f2665a6caf69cbc986a73651d2b6f8f26eb908818c4"
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
