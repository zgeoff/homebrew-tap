class Imp < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/imp"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.0.1/imp-darwin-arm64"
      sha256 "a5550f20f31aea4b23d980f609840bb1e6e8d4206870a621e1c1c7e0f0cccaf0"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.0.1/imp-darwin-x64"
      sha256 "1929b68240812adfca61dc31c185e76fe9fe965c4834c1bbe285e3ed8db6189b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/imp/releases/download/v1.0.1/imp-linux-arm64"
      sha256 "60951a67f32cb5807f2e3e8932327bfaa2d73862d4103ea91d1fca76c23f28f4"
    end
    on_intel do
      url "https://github.com/zgeoff/imp/releases/download/v1.0.1/imp-linux-x64"
      sha256 "b53fa83f30011ef5962823fc743f940fedb4ab9c548ceccc16d3220596d89a84"
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
