class Atc < Formula
  desc "Terminal control tower for coding-agent sessions"
  homepage "https://github.com/zgeoff/atc"
  version "7.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.4.1/atc-darwin-arm64"
      sha256 "d18959a8dbb423f218ee77e059df701d05fe004de4cb3b2da36c40bbcac9f23b"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.4.1/atc-darwin-x64"
      sha256 "e3f539b9564da1ef1f23a461b8a2b7656d05d2be6cbcacd9a80b6bd4752d63c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.4.1/atc-linux-arm64"
      sha256 "a85f5a84c039a2c3c8036ed18ea3bff91a393b686f6e208f9db84db392405553"
    end
    on_intel do
      url "https://github.com/zgeoff/atc/releases/download/@zgeoff/atc@7.4.1/atc-linux-x64"
      sha256 "9d2f7427e226080ba70352cdc58ce9a55fdaa6dee5bb03e080cb77ac3f398f3f"
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
