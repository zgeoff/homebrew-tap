class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "7.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v7.5.1/impz-darwin-arm64"
      sha256 "3b0140523a14ea2019eb4d7117e7eb5315f438fd2a1c9b649f3511fcdf0e898d"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v7.5.1/impz-darwin-x64"
      sha256 "0ffc21d663e83f9295898d50451e044bb752f02d0f2b45e9bf087b30fe844a2c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v7.5.1/impz-linux-arm64"
      sha256 "a2270a8e41cb58f18a61735b6fe4b2b876e511351509c33478231729bd26328f"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v7.5.1/impz-linux-x64"
      sha256 "af8c5aa6858bdef186d6043e8637f103dc9f5ecce285215aaca4db89dac2e7e5"
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
