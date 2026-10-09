class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.10.0/atc-darwin-arm64"
      sha256 "e5b5c7770fe470ed6e70c59098135dd505a1af9498db1bc01456db666bbeb3ef"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.10.0/atc-darwin-x64"
      sha256 "7b75848eb603ccf329060c8702c779d57f18f4f7537a38c4385dadf93a92b951"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.10.0/atc-linux-arm64"
      sha256 "71744b2eb04f10036738e5674223cd2cf62db56e478bb61aaf88874600d2831d"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.10.0/atc-linux-x64"
      sha256 "07c2410ab658c830b28e4300af2c1adba41ac42f430a3f3aa8283e5c3db7773f"
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
