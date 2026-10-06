class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "2.35.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.35.0/atc-darwin-arm64"
      sha256 "36a68899aa36145aebd23a650866368aa092af2120752871bbf2cb45b3e6a331"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.35.0/atc-darwin-x64"
      sha256 "080097e77be90477aa6e2d4abfac90203e807f3f1ca596cfac4bde79e7fa41cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.35.0/atc-linux-arm64"
      sha256 "3380d1454c7af4c098e2b4dd0afddc01c7d39d656f3bc6577eaa51ccc17e86b4"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@2.35.0/atc-linux-x64"
      sha256 "48fcd45123e84482dc7ee78fee6b5ee5ac5eb92bc1ed178d01849d5366a49cdf"
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
