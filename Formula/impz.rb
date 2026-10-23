class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.10.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.5/impz-darwin-arm64"
      sha256 "13952e0da6e38defcca0339589977d0f40390a12e6a1eee072d72683f9e247b6"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.5/impz-darwin-x64"
      sha256 "5abc272e44ea00146bb245d6a8f8d79efc981e53ccf9422c960ce5a1537fa064"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.5/impz-linux-arm64"
      sha256 "d832355841c913394ec879f4c0c09d1b92720e8e880f60cd3a3353be1ef40095"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.5/impz-linux-x64"
      sha256 "186d61b47ed0165d088c9e49497aca10f4503947f1487bd66aeae032c7137e2b"
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
