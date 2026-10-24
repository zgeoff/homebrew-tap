class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.3.0/atc-darwin-arm64"
      sha256 "bfcc7501f1f08c39ecd170bfb3cbaa93272c4c1afca2e8957e14805ec97478e3"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.3.0/atc-darwin-x64"
      sha256 "8fcd079ee41bdbc082262ea3fcbfb712bba529189c0f994fb3ee563937f2dcf5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.3.0/atc-linux-arm64"
      sha256 "6e88b1bdbdbcfaa7477ea42ab27f2babb6cec4cc8d5b3e67b5d2771aa8b361ec"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.3.0/atc-linux-x64"
      sha256 "5355974758030c8a15fc1aa2952fd2ff2f36e7594047af5be37bb7ed75aba74d"
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
