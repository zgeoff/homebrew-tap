class Wherewerewe < Formula
  desc "Notes for one long agent session, read back as one brief"
  homepage "https://github.com/zgeoff/wherewerewe"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/wherewerewe/releases/download/@wherewerewe/cli@0.2.1/wherewerewe-darwin-arm64"
      sha256 "56cf28c896e7c6a31329e66ffd5783c016d6c07ad24a34122d8ddeab45fd26b3"
    end
    on_intel do
      url "https://github.com/zgeoff/wherewerewe/releases/download/@wherewerewe/cli@0.2.1/wherewerewe-darwin-x64"
      sha256 "91f6c2872378810753ce23781907b091e753d5c4240371f7c4c17fc35df01f26"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/wherewerewe/releases/download/@wherewerewe/cli@0.2.1/wherewerewe-linux-arm64"
      sha256 "d2f070f5a1b9d123200b45c35cdcfcdddf46f5820571c79a00daa21821c74a40"
    end
    on_intel do
      url "https://github.com/zgeoff/wherewerewe/releases/download/@wherewerewe/cli@0.2.1/wherewerewe-linux-x64"
      sha256 "8b7073684abc05d3038e3bb2279413e3e65536b88c7e7b9d5e821847e2add8f0"
    end
  end

  def install
    # a bare download may arrive without +x
    binary = Dir["wherewerewe-*"].first
    chmod 0755, binary
    bin.install binary => "wherewerewe"
    bin.install_symlink "wherewerewe" => "www"
  end

  test do
    assert_equal "wherewerewe #{version}\n", shell_output("#{bin}/wherewerewe --version")
  end
end
