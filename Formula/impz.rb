class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "7.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v7.2.0/impz-darwin-arm64"
      sha256 "02e97ac1eb08aed4bd9330bf6093777f401f626ed38e6cbb157885a101debb12"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v7.2.0/impz-darwin-x64"
      sha256 "57adfe7fe941ff27fe3c3538c78bdbbc7fec5854231de2110ccfbcd8251bb28e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v7.2.0/impz-linux-arm64"
      sha256 "3eb23374d1f3ba66c0e38eaa1c24fc69fb779f22bdd7cfccae69b82d7631a90d"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v7.2.0/impz-linux-x64"
      sha256 "4d70a880d6302d68777a0714439c3c92df261af38ef4d7348dad1aabddff6177"
    end
  end

  def install
    # a bare download may arrive without +x, and the completions below run
    # the binary before Homebrew fixes modes
    binary = Dir["impz-*"].first
    chmod 0755, binary
    bin.install binary => "impz"
    generate_completions_from_executable(bin/"impz", "completion")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/impz --version").strip
  end
end
