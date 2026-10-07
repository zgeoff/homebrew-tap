class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.42.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.42.0/atc-darwin-arm64"
      sha256 "fcfe6ee02dfe6d387bbfef76d4cd31ddb1334c42ac565994916686577f2f9086"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.42.0/atc-darwin-x64"
      sha256 "99cc74feac96b16ce793a4593f6bcbede953e15b78be599b2881c8933f091efe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.42.0/atc-linux-arm64"
      sha256 "72e719ff2c41326a99d9c087b991b49800083649a70681a64663973105348729"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.42.0/atc-linux-x64"
      sha256 "18f5d23833525f4b02d1b03155d8daefef166359a3f7e7db0017867de1503b68"
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
