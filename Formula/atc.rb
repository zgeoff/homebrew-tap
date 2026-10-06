class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.38.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.38.0/atc-darwin-arm64"
      sha256 "c1583bc7c920e0d2387317b8bbe048787c6fa6f0baf7e1d397ae2aad54fc8864"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.38.0/atc-darwin-x64"
      sha256 "3e611af41f880b912d34871e48fb146bfcaf11327b907c5095591d4af11964d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.38.0/atc-linux-arm64"
      sha256 "a134a5264a1132c0f5d0bf5c3cab5b070e4eb22bd85f59986947c40465daa5cc"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.38.0/atc-linux-x64"
      sha256 "139ca3c06e725ec2cf905aebb14ea1caafc9df90f1dfb8968425c3e8fb2280d5"
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
