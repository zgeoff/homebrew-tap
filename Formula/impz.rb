class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "5.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v5.0.0/impz-darwin-arm64"
      sha256 "c273471cccb41ce3a04375cc08c0904c199ad27eb053fc4e2830fa5e5447a9f2"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v5.0.0/impz-darwin-x64"
      sha256 "62f6ce1811af3d85c97ce1812ee842f4074173d303347aa7c4d563eb23296bd6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v5.0.0/impz-linux-arm64"
      sha256 "b6f7b6a0d09219cdd6a834141d093361f07d912b1624ebff57c840bc007cb53a"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v5.0.0/impz-linux-x64"
      sha256 "ff6316f56e96f76739f57fcb34045e9beaba0e8f7ed8649ec74bc5b6d9ad721e"
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
