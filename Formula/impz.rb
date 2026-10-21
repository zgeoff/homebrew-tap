class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.8.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.8.3/impz-darwin-arm64"
      sha256 "d627d552d550360f620f9a89f4e8d6db9d84ad06b245698b0ecfc58787ca4e01"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.8.3/impz-darwin-x64"
      sha256 "b860b604eab6aae5a0f19fd2c39239b4acf41dc0b359357c0ba26d78d67755c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.8.3/impz-linux-arm64"
      sha256 "7d7a2eee76791279f3250ff8c66db2cd78f8113fea9758c16d54708b071eb58b"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.8.3/impz-linux-x64"
      sha256 "ef988dc71420c5c3de81a3fb1e640c9c73e49abaf5d871b6a3747685a164e012"
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
