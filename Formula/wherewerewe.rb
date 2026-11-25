class Wherewerewe < Formula
  desc "Notes for one long agent session, read back as one brief"
  homepage "https://github.com/zgeoff/wherewerewe"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/wherewerewe/releases/download/@wherewerewe/cli@0.1.0/wherewerewe-darwin-arm64"
      sha256 "e37bacf129104d06faa7f51dd14d05e97726553e053f12427f53df884c134972"
    end
    on_intel do
      url "https://github.com/zgeoff/wherewerewe/releases/download/@wherewerewe/cli@0.1.0/wherewerewe-darwin-x64"
      sha256 "d922b508a028edde19e96b26aeee701f5cddb2a64fc5f2c3d222f535728d19b7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/wherewerewe/releases/download/@wherewerewe/cli@0.1.0/wherewerewe-linux-arm64"
      sha256 "19d47db42ef9107b139dd0d84aedfec5e6940502f9a07be4506e59b95c7a6066"
    end
    on_intel do
      url "https://github.com/zgeoff/wherewerewe/releases/download/@wherewerewe/cli@0.1.0/wherewerewe-linux-x64"
      sha256 "eba2ff0ab590b6a03cccb72df26199e7cd152fcd86c77fb4beca8b1198a9c200"
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
