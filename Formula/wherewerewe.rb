class Wherewerewe < Formula
  desc "Notes for one long agent session, read back as one brief"
  homepage "https://github.com/zgeoff/wherewerewe"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/wherewerewe/releases/download/@wherewerewe/cli@0.2.2/wherewerewe-darwin-arm64"
      sha256 "7377a462a959234be6bc453468ae68c033519b2c8d5778620041e2d528836662"
    end
    on_intel do
      url "https://github.com/zgeoff/wherewerewe/releases/download/@wherewerewe/cli@0.2.2/wherewerewe-darwin-x64"
      sha256 "783216e66af64ddaa9371c55527ed279f1fbcc535c3ecd298e507e71634e4022"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/wherewerewe/releases/download/@wherewerewe/cli@0.2.2/wherewerewe-linux-arm64"
      sha256 "c3fbbbb7ed417ddd20b84796899d67476e1b118be15a7e24ae74c28f47f717fe"
    end
    on_intel do
      url "https://github.com/zgeoff/wherewerewe/releases/download/@wherewerewe/cli@0.2.2/wherewerewe-linux-x64"
      sha256 "c2e3ab5c93ef1296864c4d9333d771c958034a02bbf5652d9e76fc7c310c3d97"
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
