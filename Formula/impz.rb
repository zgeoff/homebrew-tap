class Impz < Formula
  desc "CLI for impd: persistent Linux microVMs that sleep when idle"
  homepage "https://github.com/zgeoff/impz"
  version "2.0.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.8/impz-darwin-arm64"
      sha256 "6f6897a18fb77583c096157d7cd0cb980d8f4182b75d7ac82319ce4e8f0e2c55"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.8/impz-darwin-x64"
      sha256 "dff22376f9fb6e664f0c19645db8accde7b5ef8d59fd28580b15afb72522cc63"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.8/impz-linux-arm64"
      sha256 "2ed91aa88bffde87811f6441a6c53e42e0733601f10167152d7e7cf761158fe1"
    end
    on_intel do
      url "https://github.com/zgeoff/impz/releases/download/v2.0.8/impz-linux-x64"
      sha256 "8a3a2b20c0c9e9bbf50061a15a30797ef4a0dda610dabad208fb8793f395ef0e"
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
