class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "0.28.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.28.1/imp-darwin-arm64"
      sha256 "b7148c0f71aae23f3d5674074172169fb6ef37f777daa9c32ea711a6461e4e9f"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.28.1/imp-darwin-x64"
      sha256 "52a462cb3efd25f92bac11b7007365da33ccd9afbbbc3e72d65166151a3cb0d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v0.28.1/imp-linux-arm64"
      sha256 "0fd07b38e4e4a8d19c9ae527e20022fdc77aa416575d0e9ee92afc841e87cdba"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v0.28.1/imp-linux-x64"
      sha256 "e41b80055071d010cb13946fd13866083ac3d50168a5fbcef1e7d5ae6ab6605d"
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
