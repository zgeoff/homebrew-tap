class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.34.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.34.0/atc-darwin-arm64"
      sha256 "fbbdfa742d836f79bc58f3bcbd6e90ee2b1c45911a0efac6f2c945e5b200e038"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.34.0/atc-darwin-x64"
      sha256 "36cf60b4b1a9d7c88742054bea212a3e1542951795a2bbaff3f6d4337dc5e779"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.34.0/atc-linux-arm64"
      sha256 "e6f91b9fac78c270636f0d3f8c15a3739a35f55b85e7041b0a186ae8e5b21659"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.34.0/atc-linux-x64"
      sha256 "3042ca63f198baaf896778427c3334a754f240cbbda59ab653ccae9a71c8191c"
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
