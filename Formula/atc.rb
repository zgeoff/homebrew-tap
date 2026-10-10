class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "3.11.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.11.1/atc-darwin-arm64"
      sha256 "8aac2a7694350cfa74ae6b83fa8ad6dbd9ca49dcf929ddc6c10a418132ff1e64"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.11.1/atc-darwin-x64"
      sha256 "dd45e98debee110383bcf327c88ed2f11bd831de61d868f63185c737d6db3ca3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.11.1/atc-linux-arm64"
      sha256 "e1204bc2242405b435adf238eabc7a921eb00a5ad919e43095f9712d0bc02dab"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@3.11.1/atc-linux-x64"
      sha256 "8c102bd18d13e27ede2b6a501ada07e3565cdbbd408b0eb3762bec33aa103598"
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
