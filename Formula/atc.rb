class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.4.1/atc-darwin-arm64"
      sha256 "51bc8e32d4fe63efe3da2516a3d5edcafdc338ed23673d360e75208af4f3ce98"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.4.1/atc-darwin-x64"
      sha256 "8df8a59247732b0ba50ffc2790f4ddaba3c8b879dd07877e249303c3635194fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.4.1/atc-linux-arm64"
      sha256 "abcb1d7c25f784034d165472b82a9e0cbd82015582506e378c4c2ccd9d7f8a67"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.4.1/atc-linux-x64"
      sha256 "6493339f37f1a3af0cc9929812a764b8894287ba479d42dd77c6e2d67c994e47"
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
