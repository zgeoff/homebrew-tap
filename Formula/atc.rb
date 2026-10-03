class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.23.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.23.0/atc-darwin-arm64"
      sha256 "83f19fc3a442607fe8a798a7fa8b506cd7ebbcb7dc780e3f603cb048075d0d28"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.23.0/atc-darwin-x64"
      sha256 "be03ba98ca14da09eb3c535aae952ba9bb7624e6a9934aaea53eb1def8fb1842"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.23.0/atc-linux-arm64"
      sha256 "34db965b749122f6543167d0a34970e2abbff669f6acec6ea172b46f8340216e"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.23.0/atc-linux-x64"
      sha256 "edb7a32f547638155228f4f8446a604ebdc187e40e723958086551dca01489dd"
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
