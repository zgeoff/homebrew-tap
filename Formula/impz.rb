class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "3.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v3.0.0/impz-darwin-arm64"
      sha256 "258dd1403b4759df0e5bab6abbce917b1c1ef0d3927209167e1aa74620866dfd"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v3.0.0/impz-darwin-x64"
      sha256 "e42b30344c37a2fd086a397f0a9cc4d524ee7f2907d3c2b32b81b1048a8b32a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v3.0.0/impz-linux-arm64"
      sha256 "977397a03789ed620134bd5b19fc96db9dae4f7677b96dde3c23f4f6c395b812"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v3.0.0/impz-linux-x64"
      sha256 "e75be019592c6d01011cc097a99ecdd7c3b138f64ff67305fb12d39252cb9894"
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
