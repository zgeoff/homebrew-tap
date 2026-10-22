class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.10.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.3/impz-darwin-arm64"
      sha256 "0f9d14689685aad554492c6683efa0f3fc71fae16bb699fe813079dc3511f0ed"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.3/impz-darwin-x64"
      sha256 "586b5e50dede72bcb36b13133d86670e4213341ab288a64ee660fccd751c224c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.3/impz-linux-arm64"
      sha256 "79a577c3833d9b5f4340789de982e5be8b56cf1e6a4b60171a5140a264cae952"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.10.3/impz-linux-x64"
      sha256 "b1991b8fbbd235f3dc2e46e49d897913b71ed785fdb0365e33b7d8b2cc939e87"
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
