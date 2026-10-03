class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.22.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.22.0/atc-darwin-arm64"
      sha256 "80f834fe1b22b5e6d0088c08577c40e5a788388c97d2d2f29f28e1c3e99c259e"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.22.0/atc-darwin-x64"
      sha256 "136101bff597154d748aea787a7e001acbfce7bf96542abe5e0aa7294bb1dfb2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.22.0/atc-linux-arm64"
      sha256 "20798a680d26ec5e635fdf04a4318d45b0802ab171aeaf0ff9af2d1c1efbd8ae"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.22.0/atc-linux-x64"
      sha256 "67ea3ed4d792abdee4c515741389235f7ac1fd822610435cac9a1bd713cfe962"
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
