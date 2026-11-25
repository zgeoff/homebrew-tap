class Wherewerewe < Formula
  desc "Notes for one long agent session, read back as one brief"
  homepage "https://github.com/zgeoff/wherewerewe"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/wherewerewe/releases/download/@wherewerewe/cli@0.2.0/wherewerewe-darwin-arm64"
      sha256 "01583efc107841ea5ddcbad54161c89a3ad8019fc9d4f9fd0497d3aa659ac395"
    end
    on_intel do
      url "https://github.com/zgeoff/wherewerewe/releases/download/@wherewerewe/cli@0.2.0/wherewerewe-darwin-x64"
      sha256 "876eddf4ba9197d7b2d87e7f05ff356de1256aead8afa965ddb8aa582fd91076"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/wherewerewe/releases/download/@wherewerewe/cli@0.2.0/wherewerewe-linux-arm64"
      sha256 "bdbc856ddf865fc8102e259e7c2ec444afd5a439f091672f706c35d2a3544bdd"
    end
    on_intel do
      url "https://github.com/zgeoff/wherewerewe/releases/download/@wherewerewe/cli@0.2.0/wherewerewe-linux-x64"
      sha256 "cce7955779ddb258caf9cc717b585b694444649e79658db38642a8c2bfe9379b"
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
