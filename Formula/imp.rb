class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.25.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.25.0/imp-darwin-arm64"
      sha256 "3c92be9f9adf28aafd9c4ace07b0776503be1e9bbc2ca5cff0a8cf816400226f"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.25.0/imp-darwin-x64"
      sha256 "bb082da1bcf0a6cd548d078f77a697894b13101b190de9def63013bbbb84ab6f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.25.0/imp-linux-arm64"
      sha256 "56ac22097bb22e08e60b777e3ed98682d0d31bfdaf8e68afca6ff26888a108fa"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.25.0/imp-linux-x64"
      sha256 "f76127b09ee05f0beda12fb960193921330a2659daa0f360ba87a88facca1f60"
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
