class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.19.0/imp-darwin-arm64"
      sha256 "7540af45db36a86e8461e9c5092f47c0079844accc8de5d56f932d703a7c1f2b"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.19.0/imp-darwin-x64"
      sha256 "7e6abb58e38c0ebecc21b679f9a128b344bf7ddc4c5408a4cce897f8eb5863ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.19.0/imp-linux-arm64"
      sha256 "667272580eb216a38ef11b9945c7e4d29b790396df0360ae9518056a4265a7de"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.19.0/imp-linux-x64"
      sha256 "4cd9a54778d935e5fbf22b515eb69a38ddf9c842cbddd8768b18a14dad215bc3"
    end
  end

  def install
    # a bare download may arrive without +x, and the completions below run
    # the binary before Homebrew fixes modes
    binary = Dir["imp-*"].first
    chmod 0755, binary
    bin.install binary => "imp"
    generate_completions_from_executable(bin/"imp", "completion")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/imp --version").strip
  end
end
