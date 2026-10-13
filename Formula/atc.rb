class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "4.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.3.0/atc-darwin-arm64"
      sha256 "d103e919ee7a409a3e1aecc69c0db4981bebb4f8ebcfd27a7eb8f2113f7d853c"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.3.0/atc-darwin-x64"
      sha256 "ef9beb17e8126ff7da163ef15b5ee55bc40005415509afe25878acdb20901205"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.3.0/atc-linux-arm64"
      sha256 "0e19cc039434c85d6fde7191e5777fd793fc8fc93c6e951df328a8d102c3c3f3"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@4.3.0/atc-linux-x64"
      sha256 "012ea4163891897193fa235005c3e01b4821d83ebc03221435a541afda8a4baa"
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
